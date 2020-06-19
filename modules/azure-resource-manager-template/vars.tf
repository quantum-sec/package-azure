variable "name" {
  description = "The name to be assigned to the deployment resource."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be deployed."
  type        = string
}

variable "deployement_mode" {
  description = "Specifies the mode that is used to deploy resources. One of `Incremental` or `Complete`"
  type        = string
}

variable "template_body" {
  description = "The JSON payload for Azure Resource Manager template to be deployed"
  type        = map(string)
}

variable "parameters" {
  description = "Specifies the name and value pairs that define the deployment parameters for the template."
  type        = map(string)
}

variable "parameters_body" {
  description = "Specifies a valid Azure JSON parameters file that define the deployment parameters. It can contain KeyVault references."
  type        = map(string)
}
