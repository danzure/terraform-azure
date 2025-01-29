# Create the registration token
locals {
  registration_token = azurerm_virtual_desktop_host_pool_registration_info.hostpool_registration.token
}

# Create the azure virtual network adaptor card (NIC)
resource "azurerm_network_interface" "host_nic" {
  count = var.rdsh_count
  name = "nic-host-0${count.index + 1}"
  location = azurerm_resource_group.avd_resource_group.location
  resource_group_name = azurerm_resource_group.avd_resource_group.name

  ip_configuration {
    name = "nic-${count.index + 1}_config"
    subnet_id = azurerm_subnet.avd_subnet.id
    private_ip_address_allocation = "Dynamic" 
  }
  tags = var.resource_tags
}

# Create the azure virtual machine
resource "azurerm_windows_virtual_machine" "avd_host" {
  count = var.rdsh_count
  name = "avd-host-0${count.index + 1}"
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  network_interface_ids = ["${azurerm_network_interface.host_nic.*.id[count.index]}"]
  location = var.location
  size = var.vm_size
  provision_vm_agent = true
  patch_assessment_mode = "ImageDefault"
  patch_mode = "Manual"

  enable_automatic_updates = false
  vm_agent_platform_updates_enabled = false

  admin_username = var.admin_username
  admin_password = var.admin_password

  tags = var.resource_tags

  os_disk {
    name = "osdisk-avdhost-0${count.index + 1}"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS" 
  }
  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer = "Windows-11"
    sku = "win11-24h2-avd"
    version = "latest"
  }
  depends_on = [ azurerm_resource_group.avd_resource_group, azurerm_network_interface.host_nic, azurerm_virtual_desktop_host_pool.avd_host_pool ]
}

# Deploy the AVD host registration extension to join VM(s) to the hostpool
resource "azurerm_virtual_machine_extension" "avd_host_registration" {
  count = var.rdsh_count
  name = "host-registration-0${count.index + 1}"
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
    azurerm_virtual_desktop_host_pool.avd_host_pool
  ]
}

# Deploy the AVD domain join extension to join VM(s) to a Domain