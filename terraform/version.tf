terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }

  cloud {
    organization = "anandorg1912" 
    workspaces { 
      name = "fed-id-test-dev" 
    } 
  }
}

provider "azurerm" {
  features {}
}