## Security variables
variable "sgName" {
  type        = string
  default     = "windowsDevNSG"
  description = "Default Security Group Name to be applied by default to the Dev VM."
}

variable "sourceIPs" {
  type        = list(string)
  default     = ["173.66.216.193"]
  description = "Public IPs to allow inboud communications."
}

# Using Maps
variable "nsgDetails" {
  type = map(map(string))
  default = {
    rdp = {
      name = "RDP"
      port = "3389"
    }
  }
  description = "Map of rules to be created."
}
