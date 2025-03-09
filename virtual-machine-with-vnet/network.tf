# create the resource group for the network resources
resource "azurerm_resource_group" "infra_rg" {
  name = format("rg-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  location = var.location
  tags = var.network_tags
}

# create the virtual network (vnet)
resource "azurerm_virtual_network" "infra_vnet" {
  resource_group_name = azurerm_resource_group.infra_rg.name 
  location = var.location

  name = format("vnet-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )

  address_space = ["10.0.0.0/23"] 
  depends_on = [ azurerm_resource_group.infra_rg ]
}
# create a virtual subnet (snet)
resource "azurerm_subnet" "infra_subnet" {
  resource_group_name = azurerm_resource_group.infra_rg.name
  virtual_network_name = azurerm_virtual_network.infra_vnet.name

  name = format("snet-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  address_prefixes = ["10.10.0.0/24" ]
  depends_on = [ azurerm_virtual_network.infra_vnet ]
}

# create the network security group (NSG) 
resource "azurerm_network_security_group" "nsg" {
  resource_group_name = azurerm_resource_group.infra_rg.name
  location = azurerm_resource_group.infra_rg.location

  name = format("nsg-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  depends_on = [ azurerm_resource_group.infra_rg ]
}