variable "winVMName" {
  type        = string
  default     = "WinDevOps"
  description = "Default Windows VM server name."
}

variable "windowsSKU" {
  type        = string
  default     = "2019-Datacenter"
  description = "Default VM SKU to be used in the VM."
}

variable "vmSize" {
  type        = string
  default     = "Standard_E2s_v3"
  description = "VM size. Source https://docs.microsoft.com/en-us/azure/virtual-machines/sizes"
}
