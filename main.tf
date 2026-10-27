resource "azuread_application_owner" "application_owners" {
  for_each = var.application_owners

  application_id  = each.value.application_id
  owner_object_id = each.value.owner_object_id

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
    }
  }
}

