variable "cont_parent" {
  type        = map(any)
  description = "Container Parent Variable"
  default     = {}
}

variable "nic_parent" {
  type        = map(any)
  description = "Network_Interface_Card Parent Variable"
  default     = {}
}
variable "pip_parent" {
  type        = map(any)
  description = "Public_IP Parent Variable"
  default     = {}
}
variable "rg_parent" {
  type        = map(any)
  description = "Resource Group Parent Variable"
  default     = {}
}

variable "storage_acc_parent" {
  type        = map(any)
  description = "Storage Account Parent Variable"
  default     = {}
}

variable "subnet_parent" {
  type        = map(any)
  description = "Subnet Parent Variable"
  default     = {}
}

variable "vm_parent" {
  type        = map(any)
  description = "Linux Virtual Machine Variable"
  default     = {}
}

variable "Virtual_Network_Parent" {
  type        = map(any)
  description = "Virtual Network Parent Variable"
}
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
variable "bastion" {
  type = map(any)
}
variable "random" {
  type = map(any)
}
# variable "outdoorlb" {
#   type = map(any)
# }
variable "nsg_rule" {
  type = map(any)
}
variable "appgateway" {
  type = map(any)
}