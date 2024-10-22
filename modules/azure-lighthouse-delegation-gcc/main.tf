terraform {
  required_version = ">= 1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
}

resource "azurerm_lighthouse_definition" "definition" {
  name               = var.name
  description        = var.description
  managing_tenant_id = var.managing_tenant_id

  # This name may be misleading. Currently operating on an assumption based on its usage within the provider.
  # See https://github.com/terraform-providers/terraform-provider-azurerm/issues/10120
  scope = var.subscription_id

  dynamic "authorization" {
    for_each = var.authorizations
    content {
      principal_id       = authorization.value.principal_id
      role_definition_id = authorization.value.role_definition_id
    }
  }
}

resource "azurerm_lighthouse_assignment" "assignment" {
  for_each = var.scopes

  scope                    = each.value
  lighthouse_definition_id = azurerm_lighthouse_definition.definition.id
}
