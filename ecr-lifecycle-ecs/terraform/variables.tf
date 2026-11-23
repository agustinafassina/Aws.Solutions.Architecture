variable "aws_region" {
  description = "AWS region where ECR repositories live."
  type        = string
  default     = "us-east-1"
}

variable "untagged_expire_days" {
  description = "Rule 1: expire untagged images older than this many days."
  type        = number
  default     = 1
}

variable "image_count_more_than" {
  description = "Rule 2: when image count exceeds this number, expire the oldest (keeps this many newest). ECR does NOT check ECS usage — size this to cover the deployed image plus your rollback window."
  type        = number
  default     = 3

  validation {
    condition     = var.image_count_more_than >= 2
    error_message = "Keep at least 2 images (current + one rollback target)."
  }
}
