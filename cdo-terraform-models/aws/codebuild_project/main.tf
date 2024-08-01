resource "aws_codebuild_project" "codebuild-project" {
  name         = var.name
  service_role = var.service_role

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:1.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type = "CODEPIPELINE"
  }
}

output "codebuild_project_name" {
  value = aws_codebuild_project.codebuild-project.name
}
