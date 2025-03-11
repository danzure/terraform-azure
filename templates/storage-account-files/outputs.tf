# Get outputs for the resourceGroup 
output "resourceGroupName" {
    description = "Get resource group name"
    value = azurerm_resource_group.resourceGroup.name
}

output "resourceGroupID" {
    description = "Get resource group ID"
    value = azurerm_resource_group.resourceGroup.id
}

output "resourceGroupLocation" {
    description = "Get resource group location"
    value = azurerm_resource_group.resourceGroup.location
}

# Get outputs for the storageAccount 
output "storageAccountName" {
  description = "value"
  value = azurerm_storage_account.storage_account.name
}

output "storageAccountLocation" {
  description = "Get the storageAccount location"
  value = azurerm_storage_account.storage_account.location
}