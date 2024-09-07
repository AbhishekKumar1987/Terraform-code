data "azurerm_network_interface" "nic_data_module" {
  for_each            = var.nic_data_module
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "data_kv_vm" {
  for_each            = var.ukv
  name                = each.value.name_kv
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault_secret" "uvm_data_block" {
  depends_on   = [data.azurerm_key_vault.data_kv_vm]
  for_each     = var.usecrets
  name         = each.value.name
  key_vault_id = data.azurerm_key_vault.data_kv_vm[each.key].id
}
resource "azurerm_key_vault_secret" "random_pw_block" {
  depends_on   = [random_password.rp_block]
  for_each     = var.usecrets
  name         = each.value.name_ps
  value        = random_password.rp_block[each.key].result
  key_vault_id = data.azurerm_key_vault.data_kv_vm[each.key].id
}
data "azurerm_key_vault_secret" "pvm_data_block" {
  depends_on   = [data.azurerm_key_vault.data_kv_vm, random_password.rp_block, azurerm_key_vault_secret.random_pw_block]
  for_each     = var.usecrets
  name         = each.value.name_ps
  key_vault_id = data.azurerm_key_vault.data_kv_vm[each.key].id
}

