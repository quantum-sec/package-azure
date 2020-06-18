variable "name" {
  description = "The name to be assigned to resource  created using ARM template."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be deployed."
  type        = string
}

variable "deployement_mode" {
  description = "Specifies the mode that is used to deploy resources. This value could be either Incremental or Complete."
  type        = string
}

variable "sub_id" {
  description = "This is the subscription ID for azure instance in which resources are to be deployed."
  type        = string
}

variable "template_body" {
  description = "JSON payload for Azure resource manager template deployement."
  type        = string
}
