variable "resourceLocation" {
  description = "Default value for deploying resources"
  default = "uksouth"
}

variable "defaultResourceTags" {
    description = "Default Resource Tags"
    default = {
        Deployment = "Terraform"
        Production = "Dev/Test"
        Workload = "Terrafrom Learning"
    }
}

variable "vnetResourceTags" {
  description = "Default tagging for azure vnet"
  default = {
    Deployment = "Terraform"
    Production = "Dev/Test"
    Workload = "Terraform Learning"
    ResourceType = "Virtual Network"
  }
}