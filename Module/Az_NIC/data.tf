data "azurerm_subnet" "sn_data_module" {
  for_each             = var.sn_data_module
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

