terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  version = "2.25.0"
  features {}
}

module "azure_resource_group" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:quantum-sec/package-azure.git//modules/azure-resource-group?ref=2.0.0"
  source = "../../modules/azure-resource-group"

  location = var.location
  name     = var.name
}
