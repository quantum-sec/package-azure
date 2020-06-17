variable "name" {
  description = "Specifies the name of the management lock."
  type        = string
}

variable "scope" {
  description = "The scope at which the management lock should be applied. This should be the ID of a resource."
  type        = string
}

variable "lock_level" {
  description = "Specifies the lock level for this management lock. One of `CanNotDelete` or `ReadOnly`."
  type        = string
}

variable "notes" {
  description = "Provides a description of the purpose of the lock."
  type        = string
  default     = null
}
