# specifies the azure resource provider and the version used
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
      name = "virtual-machine-with-vnet"
    }
  }
}

provider "azurerm" {
  # Configuration options for resources
  features {
    virtual_machine {
      graceful_shutdown = true
    }
  }
}