package test

import (
	"fmt"
	"testing"
	"net/http"
	"bytes"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformApiGateway(t *testing.T) {
	t.Parallel()

	// Give this lambda function a unique ID for a name so we can distinguish it from any other lambdas
	// in your AWS account
	apiName := "stripe-api-router-test"

	// Pick a random AWS region to test in. This helps ensure your code works in all regions.
	//awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	terraformOptions := &terraform.Options{
		TerraformBinary: "terragrunt",
		// The path to where our Terraform code is located
		TerraformDir: "../local/api",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name": apiName,
			"stage_name": "test",
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	//defer terraform.TgDestroyAll(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.TgApplyAll(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	apiId := terraform.Output(t, terraformOptions, "api_id")
	apiUrl := fmt.Sprintf("http://localhost:4566/restapis/%s/test/_user_request_/streams/itismystream/record", apiId)
	fmt.Println(apiUrl)
	httpMethod := terraform.Output(t, terraformOptions, "http_method")
	// Invoke the function, so we can test its output
	//response := aws.Invoke(t, awsRegion, functionName, ExampleFunctionPayload{ShouldFail: false, Echo: "hi!"})

	var jsonStr = []byte(`{}`)
    req, err := http.NewRequest(httpMethod, apiUrl, bytes.NewBuffer(jsonStr))
    req.Header.Set("Content-Type", "application/json")

    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        panic(err)
    }
    defer resp.Body.Close()

    fmt.Println("response Status:", resp.Status)

	// This function just echos it's input as a JSON string when `ShouldFail` is `false``
	assert.Equal(t, 200, resp.Status)

	// Invoke the function, this time causing it to error and capturing the error
	//response, err := aws.InvokeFunctionE(t, awsRegion, functionName, ExampleFunctionPayload{ShouldFail: true, Echo: "hi!"})

	// Function-specific errors have their own special return
	//functionError, ok := err.(*aws.FunctionError)
	//require.True(t, ok)

	// Make sure the function-specific error comes back
	//assert.Contains(t, string(functionError.Payload), "Failed to handle")
}

/*type ExampleFunctionPayload struct {
	Echo       string
	ShouldFail bool
}*/