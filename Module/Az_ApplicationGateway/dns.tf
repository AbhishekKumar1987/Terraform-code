resource "azurerm_dns_zone" "dns_block" {
  depends_on = [azurerm_application_gateway.appgw]
  for_each = var.appgateway
  name                = each.value.name_dns
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_dns_a_record" "www" {
  depends_on = [azurerm_application_gateway.appgw]
  for_each = var.appgateway
  name                = each.value.name_www
  zone_name           = azurerm_dns_zone.dns_block[each.key].name
  resource_group_name = each.value.resource_group_name
  ttl                 = 3600
  records             = [data.azurerm_public_ip.data_ag_p_block[each.key].ip_address]
}

