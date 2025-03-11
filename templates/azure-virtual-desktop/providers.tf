# configure the azure resource provider and the version used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }

  # configure the HCP organisation & workspace
  cloud {
    organization = "danzure-org"
    workspaces {
      name = "terraform-azure"
    }
  }
}

# configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    virtual_machine {
      graceful_shutdown = true
      delete_os_disk_on_deletion = true
    }
  }
}

provider "random" {
}