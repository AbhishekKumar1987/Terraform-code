resource "azurerm_public_ip" "pipblock" {
  for_each            = var.pipchildvariable
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = "Standard"

  lifecycle {
    create_before_destroy = true
  }
}