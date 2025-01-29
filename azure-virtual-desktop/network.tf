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
resource "azurerm_virtual_network" "vnet" {
  name = format("vnet-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  resource_group_name = azurerm_resource_group.network_resource_group.name
  location            = azurerm_resource_group.network_resource_group.location

  address_space = [var.vnet_address_space]
  tags          = var.network_tags
  
  depends_on    = [azurerm_resource_group.network_resource_group]
}

# Deploy the default subnet
resource "azurerm_subnet" "avd_subnet" {
  name = format("snet-%s-%s-%s-001",
    local.generate_network_name.envrionment,
    local.generate_network_name.workload,
    local.generate_network_name.location
  )
  resource_group_name  = azurerm_resource_group.network_resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes     = [var.snet_address_space]
  depends_on           = [azurerm_virtual_network.vnet]
}

# Deploy the NSG to the AVD security group
resource "azurerm_network_security_group" "avd_nsg" {
  name = format("nsg-%s-%s-%s-001",
   local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )
  location = azurerm_resource_group.avd_resource_group.location
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  tags = var.resource_tags

  depends_on = [ azurerm_resource_group.avd_resource_group ]
}

resource "azurerm_subnet_network_security_group_association" "nsg_attach" {
  subnet_id = azurerm_subnet.avd_subnet.id
  network_security_group_id = azurerm_network_security_group.avd_nsg.id
}

resource "azurerm_network_security_rule" "nsg_rule" {
  network_security_group_name = azurerm_network_security_group.avd_nsg.name
  resource_group_name = azurerm_resource_group.avd_resource_group.name

  name = "Https"
  priority = "1000"
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "443"

  source_address_prefix = "*"
  destination_address_prefix = "*"

  depends_on = [ azurerm_network_security_group.avd_nsg ]
}