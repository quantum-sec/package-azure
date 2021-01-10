variable "role_definition_id" {
  description = "The ID of the role definition for which this Lighthouse delegation will grant to the management partner."
  type        = string
  default     = "b24988ac-6180-42a0-ab88-20f7382dd24c" # Contributor
}

variable "name" {
  description = "The name of the Lighthouse delegation."
  type        = string
}

variable "description" {
  description = "The description of the Lighthouse delegation."
  type        = string
}

variable "managing_tenant_id" {
  description = "The tenant ID of the managing partner."
  type        = string
}

variable "authorizations" {
  description = "A list of authorizations request by this Lighthouse delegation. Each contains a `principal_id` defining who should have access to the delegated resources and a `role_definition_id` that describes level of access the specified principal should have."
  type = set(object({
    principal_id       = string,
    role_definition_id = string,
  }))
}

variable "subscription_id" {
  description = "The ID of the subscription in which this resource is being provisioned."
  type        = string
}

variable "scopes" {
  description = "A list of scopes that will be delegated. These should be fully qualified descriptors such as `/subscriptions/00000000-0000-0000-0000-000000000000/` or `/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-resource-group-name`."
  type        = set(string)
}
