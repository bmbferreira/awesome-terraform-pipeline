module "iam" {
  source    = "../modules/iam"
  user_name = "awesome-user"
  role_name = "awesome-role"
}

module "s3" {
  source = "../modules/s3"
  bucket = "awesome-bucket"
}

data "aws_iam_policy_document" "s3_read" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:GetObjectAcl",
    ]

    resources = [
      module.s3.s3_arn
    ]
  }
}

resource "aws_iam_policy" "s3_read_access" {
  name   = "s3_read_access"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_read.json
}


resource "aws_iam_role_policy_attachment" "s3_read_access_policy_attachment" {
  role       = module.iam.role_name
  policy_arn = aws_iam_policy.s3_read_access.arn
}
