# Create the resource group to host the storage account
resource "azurerm_resource_group" "resourceGroup" {
  name = "my-resource-group"
  location = var.default_resource_location
}

# Create the storage account 
resource "azurerm_storage_account" "storageAccount" {
  name = "storageacc545463534"
  location = var.default_resource_location
  access_tier = "hot"
  account_tier = ""

  resource_group_name = azurerm_resource_group.resourceGroup.name
  account_replication_type = "LRS"
}

resource "azurerm_storage_share_file" "FileShare" {
  name = "myFileShare"
  storage_share_id = ""
}