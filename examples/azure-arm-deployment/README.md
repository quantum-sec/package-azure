# Example deploying resources to Azure resource group using ARM Template

Here is a quick example on how to use the [azure-arm-deployment](/modules/azure-arm-deployment)
to deploy a simple ARM script template written in JSON. This example also shows how to provide parameters
to the ARM template using the parameter_override variable.

## Terraform script flow

We would be deploying a simple web application. The terraform script flow is as follows:

1. Load the [webapp.json](/examples/azure-arm-deployment/webapp.json) file.
2. It would read the value from the variable web_app_name located in [vars.tf](/examples/azure-arm-deployment/vars.tf) and
add the value as a parameter inside [webapp.json](/examples/azure-arm-deployment/webapp.json)
3. It would push the deployment into Azure using the function [azurerm_resource_group_template_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment)

## How the parameters_override works

The ARM template can be customize further using parameters similarly to how you will be deploying using
[az deployment](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli#parameters).

An example of this is from [webapp.json](/examples/azure-arm-deployment/webapp.json). You can reference the
parameter, snippet shown below

```JSON
"parameters": {
    "webAppName": { "type": "String" },
    "virtualApplications":{
      "type": "array",
      "defaultValue":
      [
        {
          "virtualPath": "/",
          "physicalPath": "site\\wwwroot",
          "preloadEnabled": false,
          "virtualDirectories": null
        }
      ]
    }
  }
```

We can use parameters_override to change the values of any variables found inside parameter.
Example shown in [main.tf](/examples/azure-arm-deployment/main.tf) would modify the webAppName with value `dummyweb-example`.
```
  parameters_override = {
     webAppName = { value = var.web_app_name }
  }
```

## Further reading

You can get the ARM (Azure Resource Manager) template schema from:
[ARM template file structure](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-syntax)

Best practices are also define in:
[Template best practices](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-best-practices)

**WARNING: You would always want your deployment to be set to incremental.**
> * **Complete** - where resources in the Resource Group not specified in the ARM Template will be destroyed.
> Resources within this Resource Group which are not defined in the ARM Template will be deleted.
> * **Incremental** - where resources are additive only.
