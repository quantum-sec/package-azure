variable "principal_id" {
  description = "The object id of service principal or AD user that will be assigned with role."
  type        = string
}

variable "name" {
  description = "A unique UUID/GUID for this Role Assignment."
  type        = string
  default     = null
}

variable "scope" {
  description = "The scope at which the Role Assignment applies to."
  type        = string
}

variable "role_definition_id" {
  description = "The Scoped-ID of the Role Definition."
  type        = string
  default     = null
}

variable "role_definition_name" {
  description = "The name of a built-in Role."
  type        = string
  default     = null
}

variable "condition" {
  description = "The condition that limits the resources that the role can be assigned to."
  type        = string
  default     = null
}

variable "condition_version" {
  description = "The version of the condition."
  type        = string
  default     = null
}

variable "delegated_managed_identity_resource_id" {
  description = "The delegated Azure Resource Id which contains a Managed Identity."
  type        = string
  default     = null
}

variable "description" {
  description = "The description for this Role Assignment."
  type        = string
  default     = null
}

variable "skip_service_principal_aad_check" {
  description = "Skip service principal AAD check. This argument is only valid if the principal_id is a Service Principal identity."
  type        = bool
  default     = false
}
