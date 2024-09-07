module "container_module" {
  depends_on        = [module.storgaccnt_module]
  source            = "../../Module/Az_Container"
  contchildvariable = var.cont_parent
}
module "nic_module" {
  depends_on        = [module.subnet_module, module.pip_module, module.rg_module]
  source            = "../../Module/Az_NIC"
  nicchildvariable  = var.nic_parent
  sn_data_module    = var.subnet_parent
  pip_data_variable = var.pip_parent
}
module "pip_module" {
  depends_on       = [module.rg_module]
  source           = "../../Module/Az_PIP"
  pipchildvariable = var.pip_parent
}
module "rg_module" {
  source          = "../../Module/Az_Resource_Group"
  rgchildvariable = var.rg_parent
}
module "storgaccnt_module" {
  depends_on      = [module.rg_module]
  source          = "../../Module/Az_Storage_Acc"
  sachildvariable = var.storage_acc_parent
}
module "subnet_module" {
  depends_on      = [module.virtual_network_module, module.rg_module]
  source          = "../../Module/Az_SubNet"
  snchildvariable = var.subnet_parent
}
module "virtualmachine_module" {
  depends_on      = [module.nic_module, module.subnet_module, module.kv_module]
  source          = "../../Module/Az_Virtual_Machine"
  lvmvariable     = var.vm_parent
  nic_data_module = var.nic_parent
  ukv             = var.usecrets
  usecrets        = var.usecrets
  random          = var.random
}
module "virtual_network_module" {
  depends_on      = [module.rg_module]
  source          = "../../Module/Az_Virtual_Network"
  vnchildvariable = var.Virtual_Network_Parent
}
module "kv_module" {
  depends_on  = [module.rg_module]
  source      = "../../Module/Az_KeyVault"
  kv_variable = var.kv_variable
  usecrets    = var.usecrets
}
module "bastion_module" {
  depends_on = [module.pip_module, module.subnet_module, module.virtualmachine_module, module.kv_module, module.nic_module]
  source     = "../../Module/Az_Bastion"
  bastion    = var.bastion
}
# module "module_loadbalancer" {
#   depends_on = [module.virtual_network_module,module.pip_module]
#   source = "../../Module/Az_LBalancer"
#   outdoorlb = var.outdoorlb
# }
module "module_nsg" {
  depends_on = [module.rg_module,module.subnet_module]
  source = "../../Module/Az_NSG"
  nsg_rule = var.nsg_rule
}
module "appgw_module" {
depends_on = [module.virtualmachine_module]
  source = "../../Module/Az_ApplicationGateway"
  appgateway = var.appgateway
}


