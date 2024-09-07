resource "azurerm_key_vault" "kv_block" {
  depends_on                 = [data.azurerm_client_config.current]
  for_each                   = var.kv_variable
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = each.value.sku_name
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}
resource "azurerm_key_vault_secret" "usecret_block" {
  depends_on   = [data.azurerm_key_vault.data_kv, azurerm_key_vault.kv_block]
  for_each     = var.usecrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
}