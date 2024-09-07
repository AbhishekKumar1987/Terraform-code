resource "azurerm_bastion_host" "bastion_block" {
  depends_on          = [data.azurerm_subnet.data_b_block, data.azurerm_public_ip.data_p_block]
  for_each            = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"
  scale_units         = 3
  tunneling_enabled   = true

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data_b_block[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data_p_block[each.key].id
  }
}