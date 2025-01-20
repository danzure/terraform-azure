# Output for the name of the resource group
output "rg_name_output" {
  value = azurerm_resource_group.avd_resource_group.name
}

# Output for location of the resource group
output "rg_location_output" {
  value = azurerm_resource_group.avd_resource_group.location
}

# Output the name for the hostpool
output "vdpool_name_output" {
  value = azurerm_virtual_desktop_host_pool.avd_host_pool.name
}

# Output name for the workspace
output "vdws_name_output" {
  value = azurerm_virtual_desktop_workspace.avd_workspace.name
}

# Output name for the DAG
output "vdag_name_output" {
  value = azurerm_virtual_desktop_application_group.avd_dag.name
}

output "network_rg_name_output" {
  value = azurerm_resource_group.network_resource_group.name
}

output "network_rg_location_output" {
  value = azurerm_resource_group.network_resource_group.location
}

output "virtual_network_name_output" {
  value = azurerm_virtual_network.virtual_network.name
}

output "vnet_ip_range_output" {
  value = azurerm_virtual_network.virtual_network.address_space
}

output "snet01_ip_range_output" {
  value = azurerm_subnet.subnet_01.address_prefixes
}