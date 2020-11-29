# Resources for terraform state in AWS

This module contains all the resources needed to save the state
remotely on aws, instead of saving it locally.
You just need to use this module inside a separate folder and
run `terraform init` and `terraform apply` to create an s3 bucket 
to save the state and a dynamodb table to handle locks.
After that you just need to configure the backend like this:

```hcl
terraform {
  backend "s3" {
    bucket         = "awesome-terraform-pipeline-state"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1" 
    dynamodb_table = "awesome-terraform-pipeline-locks"
    encrypt        = true
  }
}
```

<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | The name of the bucket to save the state | `string` | n/a | yes |
| dynamodb\_table\_name | The name of the dynamodb table to handle locks | `string` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->
