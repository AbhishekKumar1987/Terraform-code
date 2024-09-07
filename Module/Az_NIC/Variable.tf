variable "nicchildvariable" {
  type        = map(any)
  description = "Network Interface Card child variable"
  default     = {}
}
variable "pip_data_variable" {
  type        = map(any)
  description = "pip data variable"
  default     = {}
}
variable "sn_data_module" {
  type        = map(any)
  description = "subnet data variable"
}