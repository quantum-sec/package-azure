variable "location" {
  description = "The Azure region in which this dashboard will be deployed."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Shared Dashboard"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this dashboard will be provisioned."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "dashboard_properties" {
  description = "JSON data representing the dashboard body."
  type        = string
}
