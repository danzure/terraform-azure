# Random string to create unique ID for the storage account
resource "random_string" "storageAccountRandomString" {
  length = 8
  upper = false
  lower = false 
  special = false
}

# Deploys the resource group
resource "azurerm_resource_group" "resourceGroup" {
  name = var.resourceGroupName
  location = var.resourceRegion

  tags = var.resourceTags
}

# Deploys the storage account with a random number string
resource "azurerm_storage_account" "storage_account" {
name = "sadtrfm${random_string.storageAccountRandomString.result}" 
resource_group_name = azurerm_resource_group.resourceGroup.name
location = azurerm_resource_group.resourceGroup.location
account_tier = "Standard"
account_replication_type = "LRS"

tags = var.resourceTags

lifecycle {
  create_before_destroy = true
  }
}

# Create the Azure File share
resource "azurerm_storage_share" "fileShare" {
  name = var.fileShareName
  quota = var.storageAccountQuota
  enabled_protocol = "SMB"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [ azurerm_storage_account.storage_account, ]
}