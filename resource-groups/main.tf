# create the resource group
resource "azurerm_resource_group" "rg" {
  count = var.rg_count
  location = var.location
  tags = var.resource_tags

  name = format("rg-%s-%s-%s-%03d",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location, 
    count.index +1
    )
}
