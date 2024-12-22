terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
  cloud {
    organization = "danzure-org"
    workspaces {
      name = "terraform-azure"
    }
  }
}

provider "azurerm" {
  # Configuration options
}