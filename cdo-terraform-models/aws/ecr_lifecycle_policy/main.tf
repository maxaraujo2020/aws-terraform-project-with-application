resource "aws_ecr_lifecycle_policy" "ecr-lifecycle-policy" {
  repository = var.repository
  policy = jsonencode({
    rules = [{
      rulePriority = var.rule_priority
      description  = var.description
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = var.count_number
      }
      action = {
        type = "expire"
      }
    }]
  })
}
