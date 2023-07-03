variable "location" {
  description = "The Azure region in which this Azure Logic App workflow will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "name" {
  description = "The Azure region in which this Azure Logic App workflow will be deployed."
  type        = string
}

variable "scope" {
  description = "The scope at which the Role Assignment applies to."
  type        = string
}

variable "role_definition_name" {
  description = "The name of a built-in Role."
  type        = string
}
