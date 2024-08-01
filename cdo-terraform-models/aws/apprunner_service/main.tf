resource "aws_apprunner_service" "apprunner-service" {
  service_name = var.service_name

  instance_configuration {
    cpu    = var.cpu
    memory = var.memory
    # instance_role_arn                 = var.instance_role_arn
  }

  network_configuration {
    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = var.vpc_connector_arn
    }
  }

  source_configuration {
    auto_deployments_enabled = true

    image_repository {
      image_repository_type = "ECR"
      image_identifier      = "${var.repository_url}:${var.tag}"

      image_configuration {
        port                          = var.port
        runtime_environment_variables = var.runtime_environment_variables
        start_command                 = var.start_command
      }
    }

    authentication_configuration {
      access_role_arn = var.access_role_arn
    }
  }
}
