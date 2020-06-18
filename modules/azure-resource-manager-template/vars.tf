variable "name" {
  description = "The name to be assigned to logic app templates created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this logic app templates will be deployed."
  type        = string
}

variable "deployement_mode" {
  description = "Specifies the mode that is used to deploy resources. This value could be either Incremental or Complete."
  type        = string
}

variable "sub_id" {
  description = "This is the subscription ID for azure instance in which logic apps are to be deployed."
  type        = string
}

variable "template_body" {
  description = "Azure resource manager template for lighthouse deployement."
  type        = string
}
