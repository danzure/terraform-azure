resource "azurerm_resource_group" "resourceGroup" {
  name = "TestResourceGroup"
  location = var.resourceRegion
}

resource "azurerm_storage_account" "storage_account" {
name = "storage3445345346"
resource_group_name = azurerm_resource_group.resourceGroup.name
location = azurerm_resource_group.resourceGroup.location

account_tier = "Standard"
account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileShare" {
  name = "FileShare"
  quota = "10"
}