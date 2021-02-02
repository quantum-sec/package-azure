variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
  default     = "dummy_resource_group"
}

variable "deployment" {
  description = "There are only 2 allowed value for this, incremental and complete, by default it would be incremental else it would auto delete the resource that are not declared in the deployment."
  type        = string
  default     = "Incremental"
}

variable "name" {
  description = "The name of the logic app workflow."
  type        = string
  default     = "dummy_web"
}

variable "arm_script" {
  description = "This is the ARM Json file that would be deployed, this is located in the same directory as your terraform scripts."
  type        = string
  default     = "webapp.json"
}

variable "parameters_override" {
  description = "This will be the name of the resource pass into the parameter webAppName declared inside the arm_script."
  type        = map(any)
  default     = { webAppName = { value = "dummyweb-example" } }
}
