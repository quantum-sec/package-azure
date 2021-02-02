# Example deploying resources to Azure resource group using ARM Template

Here is a quick example on how to use the [azure-arm-deployment](/modules/azure-arm-deployment)
to deploy a simple ARM script template written in JSON. The example also shows how to provide parameters
to the ARM template using the parameter_override variable.

In this example, we would be deploying a simple web application. The terraform script flow is as follows:
1. Load the webapp.json file which is declared in arm_script variable
2. From the variable parameters_override
```
# Located in vars.tf
variable "parameters_override" {
  description = "This will be the name of the resource pass into the parameter webAppName declared inside the arm_script."
  type        = map(any)
  default     = {webAppName = { value = "dummyweb-example" }}
}
```

it would set the values inside the variable `webAppName` parameter field of the arm script with `dummyweb-example`

```JSON
# Located in webapp.json
"parameters": {
    "webAppName": { "type": "String" },
    # ....... truncated .......
  }
```

> Note: the parameters_content is converted from a Terraform object to JSON using jsonencode, and all
> values must be provided like you would define parameters using az deployment, with “value=xx”.

3. It would push the deployment into Azure using the function "azurerm_resource_group_template_deployment"

You can get the ARM (Azure Resource Manager) template schema from:
[ARM template file structure](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-syntax)

Best practices are also define in:
[Template best practices](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-best-practices)

**WARNING: You would always want your deployment to be set to incremental.**
> * **Complete** - where resources in the Resource Group not specified in the ARM Template will be destroyed.
> Resources within this Resource Group which are not defined in the ARM Template will be deleted.
> * **Incremental** - where resources are additive only.
