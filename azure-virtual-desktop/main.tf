# Create the Resource Group that will contain the resources for the AVD
resource "azurerm_resource_group" "avd_resource_group" {
  name = format("rg-%s-%s-%s-001",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )
  location = var.location
  
  tags = var.resource_tags
}

# Create the AVD Workspace
resource "azurerm_virtual_desktop_workspace" "avd_workspace" {
  name = format("vdws-%s-%s-%s-001",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )

  resource_group_name = azurerm_resource_group.avd_resource_group.name
  location            = azurerm_resource_group.avd_resource_group.location
  friendly_name       = var.workspace_friendly_name
  description         = "${var.workload}-avd-workspace"

  tags = var.resource_tags
}

# Create the AVD hostpool
resource "azurerm_virtual_desktop_host_pool" "avd_host_pool" {
  # Set the basic details for the hostpool
  name = format("vdpool-%s-%s-%s-001",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  location            = azurerm_resource_group.avd_resource_group.location
  friendly_name       = "${var.workload}-hostpool"
  description         = "Hostpool for ${var.workload}"

  # Set the hostpool options
  load_balancer_type       = "DepthFirst" #[BreadthFirst, DepthFirst]
  type                     = "Pooled"     #[Pooled, Personal]
  maximum_sessions_allowed = 5
  preferred_app_group_type = "Desktop" #[Desktop, RemoteApp]
  start_vm_on_connect = true 

  tags = var.resource_tags
}

# Create the registration info for the hostpool
resource "azurerm_virtual_desktop_host_pool_registration_info" "hostpool_registration" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.avd_host_pool.id
  expiration_date = var.rfc3339time
}

# Create the Azure Virtal Desktop App Group (DAG)
resource "azurerm_virtual_desktop_application_group" "avd_dag" {
  name = format("vdag-%s-%s-%s-001",
    local.generate_resource_name.envrionment,
    local.generate_resource_name.workload,
    local.generate_resource_name.location
  )
  location            = azurerm_resource_group.avd_resource_group.location
  resource_group_name = azurerm_resource_group.avd_resource_group.name
  host_pool_id        = azurerm_virtual_desktop_host_pool.avd_host_pool.id
  type                = "Desktop"

  tags = var.resource_tags
}

# Associate the AVD workspace + DAG
resource "azurerm_virtual_desktop_workspace_application_group_association" "vdws_dag_associate" {
  workspace_id         = azurerm_virtual_desktop_workspace.avd_workspace.id
  application_group_id = azurerm_virtual_desktop_application_group.avd_dag.id
}