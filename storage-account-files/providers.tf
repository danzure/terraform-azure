terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
    # Set the random provider
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
  # Set the Hashicorp HCP Terraform organisation
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
    
  }
}