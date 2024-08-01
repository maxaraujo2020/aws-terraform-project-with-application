resource "aws_acm_certificate" "certification" {
  domain_name       = "${var.url}.${var.domain}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}