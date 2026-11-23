
# ECR lifecycle policy — 2 rules per repository:
#   1) Expire untagged images (default: after 1 day)
#   2) Keep at most N images (default: 3)
#
# ECR lifecycle policies do NOT know which images ECS is using: they expire by
# age / count / tag only. Keep image_count_more_than high enough to cover the
# image currently deployed plus the versions you may roll back to.
#
# There is intentionally no "expire older than N days" rule: on a stable service
# that is not redeployed for N days it would delete the running image, and the
# next task replacement or scale-out would fail with CannotPullContainerError.
# Also, a rule with tagStatus = "any" must have the highest rulePriority, so only
# one such rule can exist per policy.

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
      }
    ]
  })
}

resource "aws_ecr_lifecycle_policy" "this" {
  for_each = toset(local.repository_names)

  repository = each.value
  policy     = local.lifecycle_policy
}
