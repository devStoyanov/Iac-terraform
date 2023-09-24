terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }

  cloud {
    organization = "dev-azure-terraform"
    workspaces {
      name = "vm-terraform-azure"
    }
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my-rg" {
  name     = var.rg_name
  location = var.rg_location
  tags = {
    environment = "dev"
  }
}

output "resource_group_id" {

  value = azurerm_resource_group.my-rg.id
}