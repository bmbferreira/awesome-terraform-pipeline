module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.16.0"

  bucket = var.bucket
  acl    = "private"

  versioning = {
    enabled = true
  }
}
