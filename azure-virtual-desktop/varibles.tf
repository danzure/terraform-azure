# Create a map of abbriviations for dynamic naming based on location, add or remove these as necessary 
locals {
  location_abbr = {
    "uksouth"        = "uks"
    "westeurope"     = "weu"
    "northeurope"    = "neu"
    "swedencentral"  = "swc"
    "southcentralus" = "scu"
  }

  # Function to generate the resource name with location prefix
  generate_resource_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.workload
  }

  # Funcation to generate the vnet & subnet names with location prefix
  generate_network_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.network_workload
  }
}

#--------------------Dynamic Name Varibles--------------------------#

variable "envrionment" {
  description = "The production level of the resources (d = dev/ p = prod)"
  type        = string
  default     = "d"
}

variable "workload" {
  description = "The name of the workload or application for the AVD deployment"
  type        = string
  default     = "trfm"
}

variable "location" {
  description = "The location of the resource deployment (example: uksouth, westeurope)"
  type        = string
  default     = "uksouth"
}

variable "resource_tags" {
  description = "Tagging to be applied to the resources"
  default = {
    Deployment  = "Terraform"
    Workload    = "Azure Virtual Desktop"
    Environment = "Development"
  }
}

# Set the friendly name for the AVD workspace
variable "workspace_friendly_name" {
  description = "Friendly name for the AVD workspace"
  type        = string
  default     = "TF AVD Workspace"
}

#-------------------Network Varibiles---------------------#

# Set the workload name for network resources
variable "network_workload" {
  description = "Name of the workload for networking resources"
  type        = string
  default     = "infra"
}

# Set the address space for the virtual network

# Set the address prefixes for the subnet

# Set the default tags for networking resources
variable "network_tags" {
  description = "Tagging applied to the virtual network resources"
  default = {
    Deployment  = "Terraform"
    Workload    = "Infrastructure"
    Envrionment = "Dev"
  }
}

#--------------------Host Varibiles----------------------#

# Set the number of AVD hosts to deploy
variable "rdsh_count" {
  description = "Number of remote desktop session hosts to deploy"
  default = 1
}

# Set the default virtual machine size (sku) for the host machines
variable "vm_size" {
  description = "Size of the virtual machine host"
  type        = string
  default     = "Standard_B2s"
}

# The OU path for joining the AVD hosts to a domain  
variable "domain_ou_path" {
  description = "The OU the AVD machines will be joined too"
  type = string
  default = "" #Enter the domain OU path here
}

# Default local admin username
variable "admin_username" {
  description = "local admin username"
  type        = string
  default     = "azureadmin"
}

# Default local admin password
variable "admin_password" {
  description = "local admin password"
  type        = string
  default     = "ChangeMe123!"
  sensitive   = true
}

# AVD host registration
variable "avd_host_registration" {
  description = "Varible to attach the virtual machine to the AVD host pool"
  type = string
  default = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_02-23-2022.zip"
}

# Host registration token expiration 
variable "rfc3339time" {
  description = "Host registration token expiration"
  default     = "2025-01-30T23:40:52Z"
}

#----------------------SA Varibles------------------------------#

variable "storage_account_tags" {
  description = "Tags to be applied to the storage account"
  default = {
    Workload = "FSLogix"
  }
}

variable "fsl_quota" {
  description = "Set the storage quote for the FSLogix file share"
  default = "5"
}

variable "msix_quota" {
  description = "Set the storage quote for the FSLogix file share"
  default = "5"
}