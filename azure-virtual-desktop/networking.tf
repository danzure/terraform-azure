# Deploy resource group for virtual network
resource "azurerm_resource_group" "network_resource_group" {
  name = format("rg-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location

  )
  location = var.location

  tags = var.network_tags
}

# Deploy the virtual network using dynamic name scheme
resource "azurerm_virtual_network" "virtual_network" {
  name = format("vnet-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  resource_group_name = azurerm_resource_group.network_resource_group.name
  location            = azurerm_resource_group.network_resource_group.location

  address_space = ["10.10.0.0/21"]
  tags          = var.network_tags
  depends_on    = [azurerm_resource_group.network_resource_group]
}

# Deploy the default subnet
resource "azurerm_subnet" "subnet_01" {
  name = format("snet-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  resource_group_name  = azurerm_resource_group.network_resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.10.0.0/24"]
  depends_on           = [azurerm_virtual_network.virtual_network]
}