data "azurerm_subnet" "sn_ag_data_block" {
  for_each             = var.appgateway
  name                 = each.value.name_snfe
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "data_ag_p_block" {
  for_each            = var.appgateway
  name                = each.value.name_data_pip
  resource_group_name = each.value.resource_group_name
}
data "azurerm_virtual_machine" "data_agfevm_block" {
  for_each = var.appgateway
  name                = each.value.name_vm
  resource_group_name = each.value.resource_group_name
}