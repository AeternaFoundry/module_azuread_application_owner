output "application_owners_id" {
  description = "Map of id values across all application_owners, keyed the same as var.application_owners"
  value       = { for k, v in azuread_application_owner.application_owners : k => v.id }
}
output "application_owners_application_id" {
  description = "Map of application_id values across all application_owners, keyed the same as var.application_owners"
  value       = { for k, v in azuread_application_owner.application_owners : k => v.application_id }
}
output "application_owners_owner_object_id" {
  description = "Map of owner_object_id values across all application_owners, keyed the same as var.application_owners"
  value       = { for k, v in azuread_application_owner.application_owners : k => v.owner_object_id }
}

