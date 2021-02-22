## Networking variables
variable "vnetName" {
  type        = string
  default     = "YORVNETNAME"
  description = "VNet name."
}

variable "devSubnetName" {
  type        = string
  default     = "dev"
  description = "Subnet name where the Vm is going to be created."
}
