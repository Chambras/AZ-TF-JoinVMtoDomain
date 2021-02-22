variable "vmUserName" {
  type        = string
  default     = "marcelo"
  description = "Username to be added to the VM."
  sensitive   = true
}

variable "password" {
  type        = string
  default     = "DoNotStorePasswordsHere!!"
  description = "Windows password to use when creating the VM. It is not recommend to store these values here."
  sensitive   = true
}

variable "non_prod_ou" {
  type        = string
  default     = "OU=Dev,OU=IT,DC=M365x735935,DC=onmicrosoft,DC=com"
  description = "OU where the server is going to be placed."
}

variable "ldapbind_account" {
  type        = string
  default     = "devopsadmin@M365x735935.onmicrosoft.com"
  description = "Domain account to use to join VMs to the domain."
  sensitive   = true
}

variable "ldapbind_pw" {
  type        = string
  default     = "DoNotStorePasswordsHere!!"
  description = "Password to use to add VMs to the domain."
  sensitive   = true
}

variable "publicIPAllocation" {
  type        = string
  default     = "Static"
  description = "Default Public IP allocation. Could be Static or Dynamic."
}

variable "osDisk" {
  type        = string
  default     = "StandardSSD_LRS"
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
}
