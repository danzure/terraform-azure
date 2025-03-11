# Resource region deployment varible
variable "resourceRegion" {
  description = "Default location for deployment of resources"
  default = "uksouth"
}

# resource tagging varible
variable "resourceTags" {
  description = "Standard tags to be applied to resources"
  default = {
   Deployment = "Terraform"
   Production = "Dev/Test"
   Workload = "Terrafrom Learning"
  }
}

# Resource Group Name
variable "resourceGroupName" {
  description = "The name of the default resource group"
  type = string
  default = "rg-d-trfm-uks-001"
}

# fileshare name 
variable "fileShareName" {
  description = "The name of the file share"
  default = "fileshare"
}

# storage account quote
variable "storageAccountQuota" {
  description = "The amount of storage for the file share in GiB"
  default = "10"
}