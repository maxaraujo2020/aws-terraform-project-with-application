output "s3_bucket" {
  value = module.s3-bucket.s3_bucket_bucket
}

output "s3_bucket_region" {
  value = module.s3-bucket.s3_bucket_region
}
