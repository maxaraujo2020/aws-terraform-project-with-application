resource "aws_apprunner_vpc_connector" "apprunner-vpc-connector" {
  vpc_connector_name = var.vpc_connector_name
  subnets            = var.subnets
  security_groups    = var.security_groups
}

output "apprunner_vpc_connector_arn" {
  value = aws_apprunner_vpc_connector.apprunner-vpc-connector.arn
}
