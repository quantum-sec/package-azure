terraform {
  required_version = ">= 1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.22"
    }

  }
}

resource "azurerm_user_assigned_identity" "azure_managed_identity" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
}
