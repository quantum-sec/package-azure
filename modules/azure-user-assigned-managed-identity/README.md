<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.22 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_user_assigned_identity.azure_managed_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region in which this Azure Logic App workflow will be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The Azure region in which this Azure Logic App workflow will be deployed. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_identity_id"></a> [managed\_identity\_id](#output\_managed\_identity\_id) | n/a |
| <a name="output_managed_identity_principal_id"></a> [managed\_identity\_principal\_id](#output\_managed\_identity\_principal\_id) | n/a |
<!-- END_TF_DOCS -->
