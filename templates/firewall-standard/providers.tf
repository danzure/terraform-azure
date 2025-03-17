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
      name = "firewall-standard"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    # configure any additional features here
  }
}