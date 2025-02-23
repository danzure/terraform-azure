# create the resource group
resource "azurerm_resource_group" "rg" {
  location = var.location
  tags = var.tags

  name = format("rg-%s-%s-%s-${var.instance}",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
    )
}

# create the recovery services vault
resource "azurerm_recovery_services_vault" "rsv" {
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  tags = var.tags
  count = var.rsv_count
  
  name = format("rsv-%s-%s-%s-%03d",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location, 
    count.index +1
    )
  sku = var.rsv_sku
  storage_mode_type = var.rsv_storage_mode 
  soft_delete_enabled = var.rsv_soft_delete
  immutability = var.rsv_immutability
  public_network_access_enabled = var.rsv_network_access

  depends_on = [ azurerm_resource_group.rg ]
}