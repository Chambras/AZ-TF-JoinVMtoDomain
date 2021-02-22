variable "location" {
  type        = string
  default     = "eastus2"
  description = "Location where the resoruces are going to be created."
}

variable "suffix" {
  default = "MZV"
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Dev"
    "Project"     = "Demo"
    "BillingCode" = "Internal"
  }
}

#Main Network RG
variable "mainNetworkRG" {
  type        = string
  default     = "YOURVNETRESOURCEGROUPNAME"
  description = "Main Nework resource group name."

}

variable "windowsDevRG" {
  type        = string
  default     = "DevVMs"
  description = "Dev VM Resource Group Name."
}
