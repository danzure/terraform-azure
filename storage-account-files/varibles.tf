# Resource region deployment varible
variable "resourceRegion" {
  description = "Default location for deployment of resources"
  default = "uksouth"
}

# resource tagging varible
variable "resourceTags" {
  description = "detault tagging for resources"
  default = {
   Deployment = "Terraform"
   Production = "Dev/Test"
   Workload = "Terrafrom Learning"
  }
}

# Resource Group Name
variable "resourceGroupName" {
  description = "Name of the resource Group"
  type = string
  default = "rg-d-trfm-uks-001"
}

variable "fileShareName" {
  description = "Default file share name"
  default = "fileshare"
}

variable "storageAccountQuota" {
  description = "Default file share quota"
  default = "50"
}