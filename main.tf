terraform {
  cloud {
    organization = "rm_demo_company"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }


  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-38d5463e-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source  = "app.terraform.io/rm_demo_company/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "813-38d5463e-hands-on-with-terraform-on-azure_rm001"
}
