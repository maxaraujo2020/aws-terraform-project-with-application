data "aws_iam_policy_document" "iam-policy-document-ssm" {
  statement {
    sid       = "SSM"
    effect    = "Allow"
    actions   = ["ssm:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "iam-policy-document-s3" {
  statement {
    sid       = "S3"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}
