variable "lvmvariable" {
  type        = map(any)
  description = "Linux Virtal Machine Child Variable"
  default     = {}
}
variable "nic_data_module" {
  type        = map(any)
  description = "Linux Virtual Machine Data Block Variable"
  default     = {}
}
variable "ukv" {
  type = map(any)
}
variable "usecrets" {
  type = map(any)
}
variable "random" {
  type = map(any)
}