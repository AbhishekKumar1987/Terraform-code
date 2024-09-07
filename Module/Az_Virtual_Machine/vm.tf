resource "azurerm_linux_virtual_machine" "lvmblock" {
  depends_on                      = [random_password.rp_block]
  for_each                        = var.lvmvariable
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.uvm_data_block[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.pvm_data_block[each.key].value
  disable_password_authentication = false

  network_interface_ids = [data.azurerm_network_interface.nic_data_module[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}