# specifies the azure resource provider and the version used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0" 
    }
  }

  # Configure the HCP organisation & workspace
  cloud {
    organization = "danzure-org"
    workspaces {
      name = "terraform-azure"
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