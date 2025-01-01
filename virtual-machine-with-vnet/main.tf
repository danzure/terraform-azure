# Create the azure resource group 
resource "azurerm_resource_group" "resourceGroup" {
  name = "rg-d-trfm-uks-001"
  location = var.resourceLocation

  # Apply default tags to resource group
  tags = var.defaultResourceTags
}

# Create the azure virtual network
resource "azurerm_virtual_network" "virtualNetwork" {
    name = "vnet-d-trfm-uks-001"
    resource_group_name = azurerm_resource_group.resourceGroup.name
    address_space = ["10.10.0.0/22"]
    location = var.resourceLocation

    tags = var.vnetResourceTags
}

# Create an azure virtual subnet-1 
resource "azurerm_subnet" "virtualSubnet-1" {
  name = "snet-d-trfm-uks-001"
  resource_group_name = azurerm_resource_group.resourceGroup.name
  virtual_network_name = azurerm_virtual_network.virtualNetwork.name
  address_prefixes = ["10.10.0.0/24"]
}

# Create an azure virtual subnet-2
resource "azurerm_subnet" "virtualSubnet-2" {
  name = "snet-d-trfm-uks-001"
  resource_group_name = azurerm_resource_group.resourceGroup.name
  virtual_network_name = azurerm_virtual_network.virtualNetwork.name
  address_prefixes = ["10.10.1.0/24"]
}

# Create the network security group (NSG) 
