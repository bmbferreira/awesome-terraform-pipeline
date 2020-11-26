provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  #checkov:skip=CKV_AWS_52:No need for mfa delete
  #checkov:skip=CKV_AWS_18:No need for access logging  
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = var.dynamodb_table_name
  #checkov:skip=CKV_AWS_28:No need for recovery in time
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
