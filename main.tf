terraform {
  backend "remote" {
    organization = "zambrana"

    workspaces {
      name = "DoT-DemoWindowsVM"
    }
  }
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
