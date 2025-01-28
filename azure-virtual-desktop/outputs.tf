# output the name of the resource group
output "rg_name_output" {
  value = azurerm_resource_group.avd_resource_group.name
}

# output the location of the resource group
output "rg_location_output" {
  value = azurerm_resource_group.avd_resource_group.location
}

# output the name for the AVD hostpool
output "vdpool_name_output" {
  value = azurerm_virtual_desktop_host_pool.avd_host_pool.name
}

# output name for the AVD workspace
output "vdws_name_output" {
  value = azurerm_virtual_desktop_workspace.avd_workspace.name
}

# output name for the DAG
output "vdag_name_output" {
  value = azurerm_virtual_desktop_application_group.avd_dag.name
}

# output virtual network name
output "vnet_name_output" {
  value = azurerm_virtual_network.vnet.name
}

# output virtual network address space
output "vnet_address_space_output" {
  value = azurerm_virtual_network.vnet.address_space
}

# output the subnet address prefix
output "snet_name_output" {
  value = azurerm_subnet.avd_subnet.address_prefixes
}