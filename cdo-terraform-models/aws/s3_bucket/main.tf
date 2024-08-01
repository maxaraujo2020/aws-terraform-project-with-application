resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket

  tags = {
    Name = var.name
  }
}

output "s3_bucket_id" {
  value = aws_s3_bucket.s3-bucket.id
}

output "s3_bucket_bucket" {
  value = aws_s3_bucket.s3-bucket.bucket
}

output "s3_bucket_region" {
  value = aws_s3_bucket.s3-bucket.region
}
