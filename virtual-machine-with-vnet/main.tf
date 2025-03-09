# create the virtual machine resource group
resource "azurerm_resource_group" "vm_rg" {
  name = format("rg-%s-%s-%s-001",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )
  location = var.location
  tags = var.tags
}

# create the virtual machine resource
