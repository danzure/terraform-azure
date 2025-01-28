# Azure provider source and version being used
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

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    virtual_machine {
      graceful_shutdown = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "random" {
}