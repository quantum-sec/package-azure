# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE ROLE ASSIGNMENT
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

data "azurerm_resource_group" "current" {
  name = "quantum-log-analytics"
}


data "azurerm_role_definition" "builtin" {
  name = "Microsoft Sentinel Automation Contributor"
}

resource "azurerm_role_assignment" "assignment" {
  scope              = data.azurerm_resource_group.current.id
  role_definition_id = data.azurerm_role_definition.builtin.id
  principal_id       = var.principal_id
}
