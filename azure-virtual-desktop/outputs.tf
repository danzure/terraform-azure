# output the name of the resource group
output "rg_name" {
  description = "Name of the resource group"
  value = azurerm_resource_group.avd_resource_group.name
}

output "workload_name" {
  description = "value"
  value = var.workload
}

output "production_level" {
  description = "The level of production for the AVD (Prod/ Dev)"
  value = var.envrionment
}

output "location" {
  description = "Location the AVD will be deployed too"
  value = var.location
}

output "vdpool_name" {
  description = "Name of the AVD host pool"
  value = azurerm_virtual_desktop_host_pool.avd_host_pool.name
}

output "vdws_name" {
  description = "Name of the AVD workspace"
  value = azurerm_virtual_desktop_workspace.avd_workspace.name
}

output "vdag_name" {
  description = "Name of the virtual desktop DAG"
  value = azurerm_virtual_desktop_application_group.avd_dag.name
}

# output virtual network address space
output "vnet_address_space" {
  description = "IP address range for the virtual network"
  value = azurerm_virtual_network.vnet.address_space
}

output "rd_host_count" {
  description = "The number of remote desktop hosts to be deployed"
  value = var.rdsh_count
}

output "profile_storage_share" {
  description = "Name of the storage account for FSLogix profiles"
  value = azurerm_storage_account.sa_fslogix.name 
}

output "app_storage_share" {
  description = "Name of the file share to host MSIXAPP"
  value = azurerm_storage_account.sa_msixapp.name
}

output "resource_tags" {
  description = "Tagging to be applied to AVD resources"
  value = var.resource_tags
}