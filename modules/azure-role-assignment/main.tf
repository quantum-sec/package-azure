# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE ROLE ASSIGNMENT
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_role_assignment" "assignment" {
  name                                   = var.name
  scope                                  = var.scope
  role_definition_id                     = var.role_definition_id
  role_definition_name                   = var.role_definition_name
  principal_id                           = var.principal_id
  description                            = var.description
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check
  condition                              = var.condition
  condition_version                      = var.condition_version
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
}
