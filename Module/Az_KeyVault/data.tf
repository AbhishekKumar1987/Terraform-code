data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "data_kv" {
  depends_on          = [azurerm_key_vault.kv_block]
  for_each            = var.usecrets
  name                = each.value.name_kv
  resource_group_name = each.value.resource_group_name
}