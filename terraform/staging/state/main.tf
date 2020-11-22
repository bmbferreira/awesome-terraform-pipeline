module "aws_backend" {
  source = "../../modules/aws-backend-state"

  bucket_name         = "awesome-terraform-pipeline-state"
  dynamodb_table_name = "awesome-terraform-pipeline-locks"
}
