 # creates a local map of location abbriviations for some of the most common azure regions (add & remove these as necessary)
locals {
  location_abbr = {
    "uksouth"        = "uks"  # UK South [Europe]
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
  default     = "tfvm"
}

variable "tags" {
  description = "Tags to be applied to the virtual machine resources"
  default = {
    Deployment  = "Terraform"
    Workload    = "Terraform VM"
    Environment = "Development"
  }
}

variable "network_workload" {
  description = "The workload or application of the virtual network"
  default = "infra"
}

variable "address_space" {
  description = "Sets the address space used by the virtual network"
  default = "10.0.0.0/23"
}

variable "network_tags" {
  description = "Tags to be applied to network infrastructure resources"
  default = {
    Deployment = "Terraform"
    Workload = "Infrastructure"
    Environment = "Development"
  }
}