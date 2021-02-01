variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "resource_name" {
  description = "The name of the resource to be added to the resource group."
  type        = string
}

variable "arm_file" {
  description = "The location of the ARM script that would be used"
  type        = string
}
