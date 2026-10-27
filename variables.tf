variable "application_owners" {
  description = <<EOT
Map of application_owners, attributes below
Required:
    - application_id
    - owner_object_id
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
EOT

  type = map(object({
    application_id  = string
    owner_object_id = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.application_owners : (
        can(regex("^(/[^/]+/[^/]+)+$", v.application_id))
      )
    ])
    error_message = "must be a valid Azure resource ID"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_owners : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.owner_object_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
}

