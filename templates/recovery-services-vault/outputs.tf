output "rsv_name_output" {
  description = "Outputs the name of the recovery services vault(s) to be deployed"
  value = azurerm_recovery_services_vault.rsv.*.name
}

output "location_output" {
  description = "value"
  value = var.location
}

output "workload_output" {
  description = "value"
  value = var.workload
}

output "storage_type_output" {
  description = "Outputs the level of redundancy to be applied to the recovery service vault(s)"
  value = var.rsv_storage_mode
}

output "immutability_output" {
  description = "Outputs the setting"
  value = var.rsv_immutability
}