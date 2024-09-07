resource "azurerm_network_interface" "nicblock" {
  for_each            = var.nicchildvariable
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.sn_data_module[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


