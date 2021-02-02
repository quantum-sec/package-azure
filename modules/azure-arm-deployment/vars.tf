variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "deployment_mode" {
  # https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-modes
  description = "The Deployment Mode for this Resource Group Template Deployment. Possible values are Complete (where resources in the Resource Group not specified in the ARM Template will be destroyed) and Incremental (where resources are additive only)."
  type        = string
  default     = "Incremental"

  validation {
    condition     = contains(["Incremental", "Complete"], var.deployment_mode)
    error_message = "This value must be either Incremental or Complete."
  }
}

variable "name" {
  description = "The name which should be used for this Resource Group Template Deployment. Changing this forces a new Resource Group Template Deployment to be created."
  type        = string
}

variable "arm_script" {
  description = "The contents of the ARM Template which should be deployed into this Resource Group."
  type        = string
}

variable "parameters_override" {
  description = "The contents of the ARM Template parameters file - containing a JSON list of parameters."
  type        = map(any)
  default     = {}
}
