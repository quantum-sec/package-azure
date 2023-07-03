terraform {
  # nonsensitive() requires >= 0.15
  required_version = ">= 0.15"

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

resource "azurerm_role_assignment" "azure_role_assignment" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = azurerm_user_assigned_identity.azure_managed_identity.principal_id
}
