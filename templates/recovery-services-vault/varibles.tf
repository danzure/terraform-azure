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

  # function to generate the resource name with location prefix
  generate_resource_name = {
    location    = local.location_abbr[var.location],
    envrionment = var.envrionment
    workload    = var.workload
  }
}

variable "envrionment" {
  description = "Specifies the production level of the resources (d = dev/ p = prod)"
  type        = string
  default     = "d"
}

variable "workload" {
  description = "Specifies the workload or appliction for the resource(s)"
  type        = string
  default     = "tfbkp"
}

variable "location" {
  description = "Specifies the location the resources will be deployed too"
  type        = string
  default     = "uksouth"
}

variable "tags" {
  description = "Specifies the tags that will be applied to resouces"
  default = {
    Deployment = "Terraform"
    Workload = "Backup"
    Envrionment = "Development"
  }
}

variable "instance" {
  description = "Specifies the instance number of the resource group"
  default = "001"
}

variable "rsv_count" {
  description = "Specifies the number of recovery service vaults to deploy"
  default = 1
}

variable "rsv_sku" {
  description = "Specifies the SKU of the recovery services vault"
  default = "Standard" #[Standard, RS0]
}

variable "rsv_storage_mode" {
  description = "Specifies the recovery services vault storage redundancy [LRS, GRS, ZRS]"
  default = "GeoRedundant" #[LocallyRedundant, GeoRedundant, ZoneRedundant]
}

variable "rsv_immutability" {
  description = "Specifies if immutability is enabled or disabled"
  default = "Disabled" #[Locked, Unlocked, Disabled]
}

variable "rsv_soft_delete" {
  description = "value"
  default = true #[true, false]
}

variable "rsv_region_restore" {
  description = "Specified is Cross Region Restore is enabled"
  default = false
}

variable "rsv_network_access" {
  description = "Specifies if public netwwork access is enabled or disabled for the rsv"
  default = true #[true, falce]
}