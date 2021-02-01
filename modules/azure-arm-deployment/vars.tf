# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Use the latest azurerm provider with features enabled
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

provider "azurerm" {
  alias = "rscgrp"
  features {}
}

# ---------------------------------------------------------------------------------------------------------------------
# Create resource from arm script
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_resource_group_template_deployment" "resource_group_deploy" {
  provider = azurerm.rscgrp

  name                = var.resource_name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"

  template_content = file(var.arm_file)
}
