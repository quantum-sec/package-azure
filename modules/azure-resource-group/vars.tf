variable "location" {
  description = "The Azure region in which this resource group will be deployed."
  type        = string
}

variable "name" {
  description = "The name to assign to the resource group."
  type        = string

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 63
    error_message = "The resource group name must be between 3 and 63 characters in length."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
