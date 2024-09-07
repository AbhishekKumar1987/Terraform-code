resource "random_password" "rp_block" {
  for_each    = var.random
  length      = each.value.length
  min_special = 1
  min_upper   = 1
  min_lower   = 3
  min_numeric = 3

  lifecycle {
    ignore_changes = [
      length,
    lower, ]
  }
}

