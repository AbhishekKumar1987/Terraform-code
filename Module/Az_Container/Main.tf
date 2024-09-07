resource "azurerm_storage_container" "contblock" {
  for_each              = var.contchildvariable
  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
}