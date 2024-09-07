cont_parent = {
  # k1 = {
  #   name                  = "vhds"
  #   storage_account_name  = "79staorage78account77"
  #   container_access_type = "private"
  # }
}
nic_parent = {
  k1 = {
    name                = "nicfrontendvm"
    resource_group_name = "anisharg"
    location            = "centralindia"
    ip_name             = "frontendip"
  }
  k2 = {
    name                = "nicbackendvm"
    resource_group_name = "anisharg"
    location            = "centralindia"
    ip_name             = "backendip"
  }
}
pip_parent = {
  k1 = {
    name                = "pipbastion"
    resource_group_name = "anisharg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  k2 = {
    name                = "piploadbalancer"
    resource_group_name = "anisharg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
rg_parent = {
  k1 = {
    name     = "anisharg"
    location = "centralindia"
  }
  # k2 = {
  #   name     = "yashikarg"
  #   location = "centralindia"
  # }
}
storage_acc_parent = {
  # k1 = {
  #   name                     = "79staorage78account77"
  #   resource_group_name      = "anisharg"
  #   location                 = "centralindia"
  #   account_tier             = "Standard"
  #   account_replication_type = "LRS"
  # }
  # k2 = {
  #   name                     = "89staorage88account87"
  #   resource_group_name      = "yashikarg"
  #   location                 = "centralindia"
  #   account_tier             = "Standard"
  #   account_replication_type = "LRS"
  # }
}
subnet_parent = {
  k1 = {
    name                 = "snfrontendvm"
    resource_group_name  = "anisharg"
    virtual_network_name = "vnvirtualmachine"
    address_prefixes     = ["10.0.0.0/24"]
  }
  k2 = {
    name                 = "snbackendvm"
    resource_group_name  = "anisharg"
    virtual_network_name = "vnvirtualmachine"
    address_prefixes     = ["10.0.1.0/24"]
  }
  k3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "anisharg"
    virtual_network_name = "vnvirtualmachine"
    address_prefixes     = ["10.0.2.0/24"]
  }
  k4 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "anisharg"
    virtual_network_name = "vnvirtualmachine"
    address_prefixes     = ["10.0.3.0/24"]
  }
}
vm_parent = {
  k1 = {
    name                = "frontendvm1"
    resource_group_name = "anisharg"
    location            = "centralindia"
    size                = "Standard_F2"
  }
  k2 = {
    name                = "backendvm1"
    resource_group_name = "anisharg"
    location            = "centralindia"
    size                = "Standard_F2"
  }
}
Virtual_Network_Parent = {
  k1 = {
    name                = "vnvirtualmachine"
    address_space       = ["10.0.0.0/16"]
    location            = "centralindia"
    resource_group_name = "anisharg"
  }
}
kv_variable = {
  k1 = {
    name                = "anishadevkeyvault"
    location            = "centralindia"
    resource_group_name = "anisharg"
    sku_name            = "premium"
  }
}
usecrets = {
  k1 = {
    name                = "username1"
    name_ps             = "password1"
    value               = "adminuservm1"
    name_kv             = "anishadevkeyvault"
    resource_group_name = "anisharg"
  }
  k2 = {
    name                = "username2"
    name_ps             = "password2"
    value               = "adminuservm2"
    name_kv             = "anishadevkeyvault"
    resource_group_name = "anisharg"
  }
}
bastion = {
  k1 = {
    name                 = "lzbastion"
    name_subnet          = "AzureBastionSubnet"
    name_pip             = "pipbastion"
    resource_group_name  = "anisharg"
    location             = "centralindia"
    virtual_network_name = "vnvirtualmachine"
  }
}
random = {
  k1 = {
    length = 8
  }
  k2 = {
    length = 8
  }
}
# outdoorlb = {
#   k1 = {
#     name_lb             = "LoadBalancer"
#     location            = "centralindia"
#     resource_group_name = "anisharg"
#     name_pool           = "BackEndAddressPool"
#     name_probe          = "H1"
#     name_rule           = "LBRule"
#     name_address_pool   = "Frontend-VM"
#     name_data_pip       = "piploadbalancer"
#     name_vnet           = "vnvirtualmachine"
#   }
# }
nsg_rule = {
  k1 = {
    name                 = "nsg_frontend"
    resource_group_name  = "anisharg"
    location             = "centralindia"
    name_snfe            = "snfrontendvm"
    virtual_network_name = "vnvirtualmachine"
  }
}
  appgateway = {
    k1 = {
      name = "landingzoneappgw"
      name_gwipconfig = "gwipconfig"
      name_feport = "feport"
      name_feipconfig = "feipconfig"
      name_beaddpool ="beaddpool"
      name_http_setting = "httpsag"
      name_listener = "listenerag"
      name_request_routing_rule = "rrule"
      name_snfe = "AppGatewaySubnet"
      name_data_pip = "piploadbalancer"
      virtual_network_name = "vnvirtualmachine"
      resource_group_name = "anisharg"
      location             = "centralindia"
      name_vm = "frontendvm1"
      name_dns = "abhishekdevsecops.online"
      name_www = "www"
      rule_type = "PathBasedRouting"
      name_url_path = "path_map"
    }
  }

