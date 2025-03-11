output "location_output" {
  description = "Outputs the location of the resources"
  value = var.location
}

output "envrionment_output" {
  description = "Outputs the envrionment level (Production/ Dev)"
  value = var.envrionment
}

output "workload_output" {
  description = "Outputs the name of the workload or application"
  value = var.workload
}

output "address_space_output" {
  description = "Output the address space for the virtual network"
  value = azurerm_virtual_network.infra_vnet.address_space
}

output "address_prefix_output" {
  description = "Output the address prefix for the virtual subnet"
  value = azurerm_subnet.infra_subnet.address_prefixes
}