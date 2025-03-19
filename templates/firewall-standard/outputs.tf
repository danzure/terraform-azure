output "output_rg_name" {
  description = "Outputs the name of the firewall resource group"
  value = azurerm_resource_group.firewall_rg.name
}