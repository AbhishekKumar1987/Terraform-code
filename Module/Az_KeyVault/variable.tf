variable "kv_variable" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
  }))
}
variable "usecrets" {
  type = map(any)
}