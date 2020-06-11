variable "location" {
  description = "The Azure region in which azure dashboards will be deployed."
  type        = string
}

variable "name" {
  description = "The name to assign to the Azure Dashboards."
  type        = string
  default     = "Quantum Security Platform"
}

variable "resource_group_name" {
  description = "The name of the resource group in which azure dashboards will be provisioned."
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "logo" {
  description = "This is to white label Azure dashboards with Quantum logo."
  type        = string
  default     = "https://www.quantum.security/assets/img/quantum-logo.svg"
}

variable "dashboard_properties" {
  description = "This is the JSON template for azure dashboard configuration."
}
