terraform {
  # It is recommended to use remote state instead of local
  # You can update these values in order to configure your remote state.
  /*  backend "remote" {
    organization = "{{ORGANIZATION_NAME}}"
    workspaces {
      name = "{{WORKSPACE_NAME}}"
    }
  }
*/
  required_version = "= 0.14.7"
  required_providers {
    azurerm = "=2.48.0"
  }
}

provider "azurerm" {
  features {}
}

# Networking RG
data "azurerm_resource_group" "mainNetowrkRG" {
  name = var.mainNetworkRG
}

# Azure VM Dev RG
resource "azurerm_resource_group" "windowsDevRG" {
  name     = var.windowsDevRG
  location = var.location

  tags = var.tags
}
