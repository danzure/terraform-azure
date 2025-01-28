# Create random storage account number
resource "random_string" "sa_random_string" {
  length = 6
  special = false
  upper = false
  numeric = true
  lower = false 
}

# Create the storage account for FSLogix profiles
resource "azurerm_storage_account" "sa_fslogix" {
  name = "safslogix${random_string.sa_random_string.id}"
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  location = azurerm_resource_group.avd_resource_group.location
  account_replication_type = "LRS"
  account_tier = "Standard" # ["Premuim" reccomended]
  #account_kind = "FileStorage"

  tags = var.storage_account_tags
}

# create the file share for fslogix profiles
resource "azurerm_storage_share" "fs_fslogix" {
  name = "fsl-profiles"
  quota = var.fsl_quota
  storage_account_id = azurerm_storage_account.sa_fslogix.id

  depends_on = [azurerm_storage_account.sa_fslogix]
}

# Create storage account for MSIX applications
resource "azurerm_storage_account" "sa_msixapp" {
  name = "samsixapp${random_string.sa_random_string.id}"
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  location = azurerm_resource_group.avd_resource_group.location
  account_replication_type = "LRS"
  account_tier = "Standard"
  #account_kind = "FileStorage"

  tags = var.storage_account_tags
}

# create the file share for MSIX app attach
resource "azurerm_storage_share" "fs_msixapp" {
  name = "msix-apps"
  quota = var.msix_quota
  storage_account_id = azurerm_storage_account.sa_msixapp.id

  depends_on = [azurerm_storage_account.sa_msixapp]
}