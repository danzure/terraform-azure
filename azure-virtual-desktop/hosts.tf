# generate the local registration token for the avd host pool
locals {
  registration_token = azurerm_virtual_desktop_host_pool_registration_info.hostpool_registration.token
}

# create the azure virtual network adaptor card (NIC)
resource "azurerm_network_interface" "host_nic" {
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  location = azurerm_resource_group.avd_resource_group.location

  count = var.rdsh_count
  name = format("nic-${var.prefix}-host-%03d", count.index + 1)

  ip_configuration {
    name = "nic-${count.index + 1}_config"
    subnet_id = azurerm_subnet.avd_subnet.id
    private_ip_address_allocation = "Dynamic" 
  }
}

# create the azure virtual machine host(s)
resource "azurerm_windows_virtual_machine" "avd_host" {
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  location = azurerm_resource_group.avd_resource_group.location

  count = var.rdsh_count
  name = format("${var.prefix}-host-%03d", count.index + 1)
  network_interface_ids = ["${azurerm_network_interface.host_nic.*.id[count.index]}"]
  size = var.vm_size
  provision_vm_agent = true
  patch_assessment_mode = "ImageDefault"
  patch_mode = "Manual"

  enable_automatic_updates = false
  vm_agent_platform_updates_enabled = true

  admin_username = var.admin_username
  admin_password = var.admin_password

  tags = var.resource_tags

  os_disk {
    name = format("osdisk-${var.prefix}-host-%03d", count.index + 1)
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS" 
  }
  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer = "Windows-11"
    sku = "win11-24h2-avd"
    version = "latest"
  }
  depends_on = [ azurerm_resource_group.avd_resource_group, azurerm_network_interface.host_nic ]
}

# deploy the avd host pool registration vm extension to each host(s)
resource "azurerm_virtual_machine_extension" "avd_host_registration" {
  count = var.rdsh_count
  name = format("hostregistration-${var.prefix}-host-%03d", count.index + 1)
  virtual_machine_id = azurerm_windows_virtual_machine.avd_host.*.id[count.index]
  publisher = "Microsoft.PowerShell"
  type = "DSC"
  type_handler_version = "2.73"
  auto_upgrade_minor_version = true

  settings = <<-SETTINGS
    {
      "modulesUrl": "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_09-08-2022.zip",
      "configurationFunction": "Configuration.ps1\\AddSessionHost",
      "properties": {
        "HostPoolName":"${azurerm_virtual_desktop_host_pool.avd_host_pool.name}"
      }
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {
    "properties": {
      "registrationInfoToken": "${local.registration_token}"
    }
  }
PROTECTED_SETTINGS

  depends_on = [
    azurerm_virtual_desktop_host_pool.avd_host_pool, azurerm_windows_virtual_machine.avd_host
  ]
}

# deploy the domain join vm extention to each virtual machine host(s)
resource "azurerm_virtual_machine_extension" "domain_join" {
  count                      = var.rdsh_count
  name                       = format("domainjoin-${var.prefix}-host-%03d", count.index + 1)
  virtual_machine_id         = azurerm_windows_virtual_machine.avd_host.*.id[count.index]
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
      "Name": "${var.domain_name}",
      "OUPath": "${var.domain_ou_path}",
      "User": "${var.domain_join_upn}@${var.domain_name}",
      "Restart": "true",
      "Options": "3"
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "Password": "${var.domain_password}"
    }

PROTECTED_SETTINGS
  lifecycle {
    ignore_changes = [settings, protected_settings]
  }
}