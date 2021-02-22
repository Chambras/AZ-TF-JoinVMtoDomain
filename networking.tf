data "azurerm_virtual_network" "mainVNet" {
  name                = var.vnetName
  resource_group_name = var.mainNetworkRG
}
data "azurerm_subnet" "devSubnet" {
  name                 = var.devSubnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.mainNetworkRG
}
