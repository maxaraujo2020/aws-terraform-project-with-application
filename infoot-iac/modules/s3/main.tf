# Creates S3 bucket

module "s3-bucket" {
  source = "../../../cdo-terraform-models/aws/s3_bucket"
  bucket = "${var.app_name}-s3-bucket"
  name   = "${var.app_name}-s3-bucket"
}

module "s3-bucket-acl" {
  source = "../../../cdo-terraform-models/aws/s3_bucket_acl"
  bucket = module.s3-bucket.s3_bucket_id
}
