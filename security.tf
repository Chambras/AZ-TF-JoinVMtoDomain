resource "azurerm_network_security_group" "winDevRDPNSG" {
  name                = "${var.suffix}rdpNSG"
  location            = azurerm_resource_group.windowsDevRG.location
  resource_group_name = azurerm_resource_group.windowsDevRG.name

  security_rule {
    name                       = var.nsgDetails["rdp"].name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = var.nsgDetails["rdp"].port
    source_address_prefixes    = var.sourceIPs
    destination_address_prefix = "VirtualNetwork"
  }

  tags = var.tags
}
