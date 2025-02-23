# creates a local map of location abbriviations for some of the most common azure regions (add & remove these as necessary)
locals {
  location_abbr = {
    "uksouth"        = "uks"  # UKSouth [Europe]
    "westeurope"     = "weu"  # West Europe [Europe]
    "northeurope"    = "neu"  # North Europe [Europe]
    "southcentralus" = "scus" # South Central US [US]
    "eastus"         = "eus"  # East US [US]
    "westus"         = "wus"  # West US [US]
    "australiaeast"  = "aue"  # Australia East [Asia]
    "japaneast"      = "jpe"  # Japan East [Asia]
    "southeastasia"  = "sea"  # South East Asia [Asia]
  }

  # function to generate resource name using the envrionment, workload & location prefix
  generate_resource_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.workload
  }

  # funcation to generate the vnet & subnet names with location prefix
  generate_network_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.network_workload
  }
}

variable "location" {
  description = "Specified the location the resources will be deployed too, this value will be added to the resource name"
  type        = string
  default     = "uksouth"
}

variable "envrionment" {
  description = "The production level of the resources (d = dev/ p = prod)"
  type        = string
  default     = "d"
}

variable "workload" {
  description = "The name of the workload or application for the AVD deployment"
  type        = string
  default     = "tfavd"
}

variable "resource_tags" {
  description = "Tagging to be applied to the resources"
  default = {
    Deployment  = "Terraform"
    Workload    = "Azure Virtual Desktop"
    Environment = "Development"
  }
}

variable "workspace_friendly_name" {
  description = "Friendly name for the AVD workspace"
  type        = string
  default     = "TF AVD Workspace"
}

variable "network_workload" {
  description = "Name of the workload for networking resources, this value will be added to the name of the resource"
  type        = string
  default     = "infra"
}

variable "vnet_address_space" {
 description = "IP address space for the virtual network" 
 type = string
 default = "10.10.0.0/22"
}

variable "snet_address_prefix" {
  description = "IP address prefix for the AVD subnet"
  type = string
  default = "10.10.0.0/24"
}

variable "network_tags" {
  description = "Tagging applied to network infrastructure resources"
  default = {
    Deployment  = "Terraform"
    Workload    = "Infrastructure"
    Envrionment = "Dev"
  }
}

variable "rdsh_count" {
  description = "Number of remote desktop session hosts to deploy"
  default = 1
}

variable "vm_size" {
  description = "Size of the virtual machine host(s)"
  type        = string
  default     = "Standard_B2s"
}

variable "prefix" {
  description = "Prefix name for the name of the AVD host(s)"
  type = string
  default = "avdtf"
}
 
variable "domain_ou_path" {
  description = "The OU the AVD machines will be joined too"
  type = string
  default = "" #Enter the domain OU path here
}

variable "domain_name" {
  description = "The domain the AVD host(s) will be joined too"
  type = string
  default = "hosts.local"
}

variable "domain_join_upn" {
  description = "The username for the account to join the domain"
  type = string
  default = "domainjoinuser" # do not include the domain name, this this appended
}

variable "domain_password" {
description = "Password for the user to authenticate the join to the domain"
type = string
sensitive = true
default = "ChangeMe123!"
}

variable "admin_username" {
  description = "local admin username for the avd host(s)"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "local admin password for the avd host(s)"
  type        = string
  default     = "ChangeMe123!"
  sensitive   = true
}

variable "avd_host_registration" {
  description = "Varible to attach the virtual machine to the AVD host pool"
  type = string
  default = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_02-23-2022.zip"
}

variable "rfc3339time" {
  description = "Host registration token expiration date & time"
  default     = "2025-02-20T23:40:52Z" #
}

variable "storage_account_tags" {
  description = "Tags to be applied to the storage account"
  default = {
    Workload = "FSLogix"
    Deployment = "Terraform"
  }
}

variable "fsl_quota" {
  description = "Set the storage quota (GB) for the FSLogix file share"
  default = "5"
}

variable "msix_quota" {
  description = "Set the storage quota (GB) for the FSLogix file share"
  default = "5"
}
