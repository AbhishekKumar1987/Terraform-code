resource "azurerm_application_gateway" "appgw" {
  for_each = var.appgateway
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = each.value.name_gwipconfig
    subnet_id = data.azurerm_subnet.sn_ag_data_block[each.key].id
  }

  frontend_port {
    name = each.value.name_feport
    port = 80
  }

  frontend_ip_configuration {
    name                 = each.value.name_feipconfig
    public_ip_address_id  = data.azurerm_public_ip.data_ag_p_block[each.key].id
  }

  backend_address_pool {
    name = each.value.name_beaddpool
    ip_addresses = [data.azurerm_virtual_machine.data_agfevm_block[each.key].private_ip_address]
  }

  backend_http_settings {
    name                  = each.value.name_http_setting
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }
  http_listener {
    name                           = each.value.name_listener
    frontend_ip_configuration_name = each.value.name_feipconfig
    frontend_port_name             = each.value.name_feport
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = each.value.name_request_routing_rule
    rule_type                  = each.value.rule_type
    http_listener_name         = each.value.name_listener
    backend_address_pool_name  = each.value.name_beaddpool
    backend_http_settings_name = each.value.name_http_setting
    url_path_map_name     = each.value.name_url_path
    priority = 100
  }
  url_path_map {
    name                   = "path_map"
    default_backend_address_pool_name  = each.value.name_beaddpool    # Default backend if no path matches
    default_backend_http_settings_name = each.value.name_http_setting

    path_rule {
      name                       = "api_path_rule"
      paths                      = ["/api/*"]
      backend_address_pool_name   = each.value.name_beaddpool
      backend_http_settings_name  = each.value.name_http_setting
    }

    path_rule {
      name                       = "web_path_rule"
      paths                      = ["/web/*"]
      backend_address_pool_name   = each.value.name_beaddpool
      backend_http_settings_name  = each.value.name_http_setting
    }
  }
}
