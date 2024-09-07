data "azurerm_subnet" "data_b_block" {
  for_each             = var.bastion
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "data_p_block" {
  for_each            = var.bastion
  name                = each.value.name_pip
  resource_group_name = each.value.resource_group_name
}