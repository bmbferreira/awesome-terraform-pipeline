package terratests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"gotest.tools/assert"
)

func TestS3EnabledVersioning(t *testing.T) {
	t.Parallel()

	awsRegion := "us-east-1"

	// Local endpoints to use localstack instead of calling aws itself.
	// It should be using already the endpoints defined in terraform but we have to repeat it here in some specific situations.
	// More information here: https://jq1.io/posts/go_mod_terratest_localstack/
	var LocalEndpoints = map[string]string{
		"apigateway":     "http://localhost:4566",
		"cloudformation": "http://localhost:4566",
		"cloudwatch":     "http://localhost:4566",
		"dynamodb":       "http://localhost:4566",
		"es":             "http://localhost:4566",
		"firehose":       "http://localhost:4566",
		"iam":            "http://localhost:4566",
		"kinesis":        "http://localhost:4566",
		"lambda":         "http://localhost:4566",
		"route53":        "http://localhost:4566",
		"redshift":       "http://localhost:4566",
		"s3":             "http://localhost:4566",
		"secretsmanager": "http://localhost:4566",
		"ses":            "http://localhost:4566",
		"sns":            "http://localhost:4566",
		"sqs":            "http://localhost:4566",
		"ssm":            "http://localhost:4566",
		"stepfunctions":  "http://localhost:4566",
		"sts":            "http://localhost:4566",
	}
	aws.SetAwsEndpointsOverrides(LocalEndpoints)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../local",
		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
			"AWS_REGION":         awsRegion,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	// It doesn't matter much if you're running it over localstack because everything will be discarded with the container
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Verify that our Bucket has versioning enabled
	actualStatus := aws.GetS3BucketVersioning(t, awsRegion, "awesome-bucket")
	expectedStatus := "Enabled"
	assert.Equal(t, expectedStatus, actualStatus)
}
