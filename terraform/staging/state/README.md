# Resources for terraform state in AWS

This sub folder contains all the resources needed to save the state
remotely on aws, instead of saving it locally.
You just need to run `terraform init` and `terraform apply`
to create an s3 bucket to save the state and a dynamodb table to handle locks.
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
