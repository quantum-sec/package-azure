# ---------------------------------------------------------------------------------------------------------------------
# Create resource from arm script
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.38"
    }
  }
}

resource "azurerm_resource_group_template_deployment" "resource_group_deploy" {
  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"

  template_content   = var.arm_script
  parameters_content = jsonencode(var.parameters_override)
}
