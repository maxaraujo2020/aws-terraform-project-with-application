resource "aws_cloudfront_origin_access_control" "cloudfront_origin_access_control" {
  name                              = "${var.app_name}-cdn"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
