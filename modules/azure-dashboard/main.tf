# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE SHARED DASHBOARD
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_dashboard" "dashboard" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  location             = var.location
  dashboard_properties = var.dashboard_properties

  tags = merge(
    {
      "terraform-managed" = "true"
    },
    var.tags
  )
}
