terraform {
  backend "s3" {
    bucket         = "awesome-terraform-pipeline-state"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "awesome-terraform-pipeline-locks"
    encrypt        = true
  }
}
