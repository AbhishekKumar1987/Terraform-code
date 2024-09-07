# resource "azurerm_lb" "lb_block" {
#   depends_on = [data.azurerm_public_ip.data_p_block]
#   for_each = var.outdoorlb
#   name                = each.value.name_lb
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   sku                 = "Standard"
#   sku_tier            = "Regional"

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = data.azurerm_public_ip.data_p_block[each.key].id
#   }
# }
# resource "azurerm_lb_backend_address_pool" "backendpool_block" {
#   for_each = var.outdoorlb
#   loadbalancer_id = azurerm_lb.lb_block[each.key].id
#   name            = each.value.name_pool
# }
# resource "azurerm_lb_probe" "Probe_block" {
#   for_each = var.outdoorlb
#   loadbalancer_id     = azurerm_lb.lb_block[each.key].id
#   name                = each.value.name_probe
#   port                = 80
#   interval_in_seconds = "5"
# }
# resource "azurerm_lb_rule" "rule_block" {
#   for_each = var.outdoorlb
#   loadbalancer_id                = azurerm_lb.lb_block[each.key].id
#   name                           = each.value.name_rule
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 80
#   frontend_ip_configuration_name = "PublicIPAddress"
#   probe_id                       = azurerm_lb_probe.Probe_block[each.key].id
#   backend_address_pool_ids = [azurerm_lb_backend_address_pool.backendpool_block[each.key].id]
# }
# resource "azurerm_lb_backend_address_pool_address" "pool_address_block" {
#   depends_on = [data.azurerm_virtual_network.vnet_data,data.azurerm_virtual_machine.data_fevm_block]
#   for_each = var.outdoorlb
#   name                    = each.value.name_address_pool     
#   backend_address_pool_id = azurerm_lb_backend_address_pool.backendpool_block[each.key].id
#   virtual_network_id      = data.azurerm_virtual_network.vnet_data[each.key].id
#   ip_address              = data.azurerm_virtual_machine.data_fevm_block.private_ip_address
# }