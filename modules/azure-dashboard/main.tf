# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SHARED DASHBOARDS FOR A SUBSCRIPTION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_dashboard" "dash" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  tags                      = merge(
      {
        "terraform-managed" = "true"
      },
    var.tags
    )
  dashboard_properties      = var.dashboard_properties
}
