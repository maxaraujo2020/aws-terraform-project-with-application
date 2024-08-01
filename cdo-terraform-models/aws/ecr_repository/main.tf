resource "aws_ecr_repository" "ecr-repository" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr-repository.repository_url
}

output "ecr_repository_name" {
  value = aws_ecr_repository.ecr-repository.name
}
