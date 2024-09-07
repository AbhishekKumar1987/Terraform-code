# data "azurerm_virtual_network" "vnet_data" {
#   for_each = var.outdoorlb
#   name                = each.value.name_vnet
#   resource_group_name = each.value.resource_group_name
# }
# data "azurerm_public_ip" "data_p_block" {
#   for_each            = var.outdoorlb
#   name                = each.value.name_data_pip
#   resource_group_name = each.value.resource_group_name
# }
# data "azurerm_virtual_machine" "data_fevm_block" {
#   name                = "frontendvm1"
#   resource_group_name = "anisharg"
# }