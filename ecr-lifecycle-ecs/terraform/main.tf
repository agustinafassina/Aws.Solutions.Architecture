# ECR lifecycle policy — 3 rules per repository:
#   1) Expire untagged images (default: after 1 day)
#   2) Keep at most N images (default: 3)
#   3) Expire images older than N days (default: 90) — safety net

locals {
  lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images after ${var.untagged_expire_days} day(s)"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = var.untagged_expire_days
        }
        action = { type = "expire" }
      },
      {
        rulePriority = 2
        description  = "Keep only last ${var.image_count_more_than} images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = var.image_count_more_than
        }
        action = { type = "expire" }
      },
      {
        rulePriority = 3
        description  = "Safety net: expire images older than ${var.max_image_age_days} days"
        selection = {
          tagStatus   = "any"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = var.max_image_age_days
        }
        action = { type = "expire" }
      }
    ]
  })
}

resource "aws_ecr_lifecycle_policy" "this" {
  for_each = toset(local.repository_names)

  repository = each.value
  policy     = local.lifecycle_policy
}
