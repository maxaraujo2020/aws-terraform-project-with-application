resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  bucket     = var.bucket
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = var.bucket
  rule {
    object_ownership = "ObjectWriter"
  }
}