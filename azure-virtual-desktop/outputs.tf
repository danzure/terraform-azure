# output the name of the resource group
output "rg_name" {
  description = "Name of the resource group"
  value = azurerm_resource_group.avd_resource_group.name
}

output "workload_name" {
  description = "Outputs the name of the application or worklaod specified"
  value = var.workload
}

output "production_level" {
  description = "Outputs the production level for the deployment (prod/ dev)"
  value = var.envrionment
}

output "location" {
  description = "Outputs the location the resources will be deployed too"
  value = var.location
}

output "resource_group_id" {
  description = "Outputs the id of the avd resource group"
  value = azurerm_resource_group.avd_resource_group.id
}

output "vdpool_name" {
  description = "Outputs the name of the avd host pool"
  value = azurerm_virtual_desktop_host_pool.avd_host_pool.name
}

output "vdws_name" {
  description = "Outputs the name of the avd workspace"
  value = azurerm_virtual_desktop_workspace.avd_workspace.name
}

output "vdag_name" {
  description = "Outputs the name of the virtual desktop application group (dag)"
  value = azurerm_virtual_desktop_application_group.avd_dag.name
}

output "vnet_rg_name" {
  description = "Outputs the name of the resurce group containing the virtual network"
  value = azurerm_resource_group.network_resource_group.name
}

output "vnet_address_space" {
  description = "Outputs the ip address range for the virtual network"
  value = azurerm_virtual_network.vnet.address_space
}

output "snet_address_prefix" {
  description = "Outputs the address space for the virtual subnet"
  value = azurerm_subnet.avd_subnet.address_prefixes
}

output "rd_host_count" {
  description = "Outputs the number of remote desktop hosts to be deployed"
  value = var.rdsh_count
}

output "profile_storage_share" {
  description = "Outputs the of the storage account for FSLogix profiles"
  value = azurerm_storage_account.sa_fslogix.name 
}

output "app_storage_share" {
  description = "Outputs the name of the storage account for MSIXAPP"
  value = azurerm_storage_account.sa_msixapp.name
}

output "resource_tags" {
  description = "Outputs the tags that will be applied to the avd resources"
  value = var.resource_tags
}

output "workspace_friendly_name" {
  description = "Outputs the friendly name for the avd workspace"
  value = azurerm_virtual_desktop_workspace.avd_workspace.friendly_name
}