module "resource_group" {
  source = "../../modules/azure-arm-deployment"

  name                = var.name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment

  arm_script = file("${path.module}/${var.arm_script}")

  parameters_override = var.parameters_override
}
