# configure the azure resource provider and the version used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0" 
    }
  }

  # set the hashicorp HCP terraform organisation + workspace for remote state file (remove if unused)
  cloud {
    organization = "danzure-org"
    workspaces {
      name = "azure-virtual-desktop"
    }
  }
}

# configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    
  }
}

provider "random" {
}