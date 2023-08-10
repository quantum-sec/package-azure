terraform {
  required_version = ">= 1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}
module "deploy_web_app_sample" {
  source = "../../modules/azure-arm-deployment"

  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment

  arm_script = file("${path.module}/${var.arm_script}")

  parameters_override = {
    webAppName = { value = var.web_app_name }
  }
}
