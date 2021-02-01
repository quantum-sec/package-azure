variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "deployment_mode" {
  description = "Specifies the mode that is used to deploy resources."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Resource Group Template Deployment."
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
