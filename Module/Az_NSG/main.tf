resource "azurerm_network_security_group" "frontend_nsg_block" {
  for_each = var.nsg_rule
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

   security_rule {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTPS"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-All-Outbound"
    priority                   = 200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# NSG Associations
resource "azurerm_subnet_network_security_group_association" "frontend_nsg_assoc" {
  for_each = var.nsg_rule
  subnet_id                 = data.azurerm_subnet.sn_nsg_data_block[each.key].id
  network_security_group_id = azurerm_network_security_group.frontend_nsg_block[each.key].id
}