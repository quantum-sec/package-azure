package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func Setup(path string) {
	providerPath := path + "/provider.tf"
	defer os.Remove(providerPath)
	files.CopyFile("../test-provider.tf", providerPath)
}

func TearDown(path string) {
	defer os.Remove(path + "/provider.tf")
}

func TestResourceGroupCreation(t *testing.T) {
	t.Parallel()

	modulePath := "../examples/azure-resource-group"
	expectedName := "TEST_RESOURCE_GROUP_NAME"
	expectedLocation := "southeastasia"

	Setup(modulePath)

	terraformOptions := &terraform.Options{
		TerraformDir: modulePath,
		Vars: map[string]interface{}{
			"name":     expectedName,
			"location": expectedLocation,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualName := terraform.Output(t, terraformOptions, "name")
	actualLocation := terraform.Output(t, terraformOptions, "location")

	assert.Equal(t, expectedName, actualName)
	assert.Equal(t, expectedLocation, actualLocation)

	TearDown(modulePath)
}
