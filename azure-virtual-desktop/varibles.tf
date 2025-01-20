# Create a map of abbriviations for dynamic naming based on location
locals {
  location_abbr = {
    "uksouth"        = "uks"
    "westeurope"     = "weu"
    "northeurope"    = "neu"
    "southcentralus" = "scu"
  }

  # Function to generate the resource name with location prefix
  generate_resource_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.workload
  }

  # Funcation to generate the network resource names with location prefix
  generate_network_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.network_workload
  }
}

# Global varibles (envrionment, workload, location, tags)
variable "envrionment" {
  description = "The production level of the resources (d = dev/ p = prod"
  type        = string
  default     = "d"
}

variable "workload" {
  description = "The workload or application for the avd deployment"
  type        = string
  default     = "trfm"
}

variable "location" {
  description = "The location of the resource deployment (uksouth, westeurope ect)"
  type        = string
  default     = "uksouth"
}

variable "resource_tags" {
  description = "Tagging to be applied to the AVD"
  default = {
    Deployment  = "Terraform"
    Workload    = "Terraform AVD"
    Environmwnt = "Dev"
  }
}

# Set the AVD workspace friendly name
variable "workspace_friendly_name" {
  description = "Friendly name for the AVD workspace"
  type        = string
  default     = "TF AVD Workspace"
}

# Set the registration token expiration
variable "rfc3339time" {
  description = "Registration token expiration"
  default     = "2025-01-30T23:40:52Z"
}

# Set the default virtual machine size of the host machine 
variable "vm_size" {
  description = "The default SKU of VM used for each deployed machine"
  type        = string
  default     = "Standard_B2s"
}

# Set the workload name for network resources
variable "network_workload" {
  description = "Defines the workload for the network resources"
  type        = string
  default     = "infra"
}

# Set the default tags for network resources
variable "network_tags" {
  description = "Tags to be applied to networking resources"
  default = {
    Deployment  = "Terraform"
    Envrionment = "Dev"
    Workload    = "Infra"
  }
}

# Set the number of AVD hosts to deploy
variable "rdsh_count" {
  description = "The number of virtual machines to deploy"
  default = 2
}

variable "avd_ou_path" {
  description = "The OU the AVD machines will be joined too"
  type = string
  default = "" #Enter OU path
}

variable "avd_host_registration" {
  description = "Varible to attach the virtual machien to the AVD host pool"
  type = string
  default = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_02-23-2022.zip"
}

variable "admin_username" {
  description = "local admin username"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "local admin password"
  type        = string
  default     = "ChangeMe123!"
  sensitive   = true
}