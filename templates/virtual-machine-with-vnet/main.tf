# create the virtual machine resource group
resource "azurerm_resource_group" "vm_rg" {
  name = format("rg-%s-%s-%s-001",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )
  location = var.location
  tags = var.tags
}

# create the virtual machine resource
resource "azurerm_windows_virtual_machine" "" {
  resource_group_name = azurerm_resource_group.vm_rg
  location = azurerm_resource_group.vm_rg.location

  name = "vm-dev-001"
  size = ""

  network_interface_ids = azurerm_network_interface.vm_nic.id 
  os_disk {
    storage_account_type = ""
    caching = "ReadWrite"
  }
  admin_username = ""
  admin_password = ""

  tags = var.tags
}

# create network interface card
resource "azurerm_network_interface" "vm_nic" {
  resource_group_name = azurerm_resource_group.vm_rg.name
  location = azurerm_resource_group.vm_rg.location
  tags = var.tags

  name = "nic-"
  ip_configuration {
    name = ""
    private_ip_address_allocation = "Dynamic"
  }
}