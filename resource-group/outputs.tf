output "rg_name_output" {
  description = "Output the name of the deployed resource group(s)"
  value = azurerm_resource_group.rg[*].name
}

output "location_output" {
  description = "Output the deployment location"
  value = var.location
}

output "workload_output" {
  description = "Output the name of the application or workload"
  value = var.workload
}