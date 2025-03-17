# deploy the azure firewall resource group
resource "azurerm_resource_group" "rg_firewall" {
  name = "rg-d-infra-uks-001"
  location = "uksouth"

  tags = var.tags
}