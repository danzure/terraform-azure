resource "azurerm_resource_group" "name" {
  name = "TestResourceGroup"
  location = "uksouth"
}

resource "azurerm_storage_account" "name" {
name = "storage3445345346"
resource_group_name = azurerm_resource_group.name
location = azurerm_resource_group.location
access_tier = ""
account_tier = ""
account_replication_type = "Standard_LRS"
}