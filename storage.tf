data "azurerm_storage_account" "mainSA" {
  name                = var.saName
  resource_group_name = var.mainNetworkRG
}
