output "windowsDevRG" {
  value       = azurerm_resource_group.windowsDevRG.name
  description = "Azure DevOps Resource Group."
  sensitive   = false
}

# VM Information
# Azure DevOps Server
output "winVMName" {
  value       = azurerm_windows_virtual_machine.winDevVM.name
  description = "Windoes Dev Name."
  sensitive   = false
}
output "winDevPublicIP" {
  value       = azurerm_public_ip.winDevPublicIP.ip_address
  description = "Windoes Dev public IP."
  sensitive   = false
}

output "winDevPrivateIP" {
  value       = azurerm_network_interface.winDevNI.private_ip_address
  description = "Windoes Dev private IP."
  sensitive   = false
}
