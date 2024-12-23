# Randomiser here

# Default deployment varibles
variable "resourceRegion" {
  description = "Default location for deployment of resources"
  default = "uksouth"
}

variable "resourceTags" {
  description = "detault tagging for resources"
  default = {
    Deployment = "Terraform"
    Envrionment = "Development"
    Workload = "Studying"
  }
}

variable "fileShareName" {
  description = "Default file share name"
  default = "fileshare"
}

variable "storageAccountQuota" {
  description = "Default file share quota"
  default = "50"
}