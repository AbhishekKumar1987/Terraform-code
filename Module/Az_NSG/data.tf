data "azurerm_subnet" "sn_nsg_data_block" {
  for_each             = var.nsg_rule
  name                 = each.value.name_snfe
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
 