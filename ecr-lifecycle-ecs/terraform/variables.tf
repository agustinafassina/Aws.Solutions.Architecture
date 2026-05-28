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
  description = "Rule 2: when image count exceeds this number, expire oldest (keeps this many newest, excluding images in use by ECS)."
  type        = number
  default     = 3
}

variable "max_image_age_days" {
  description = "Rule 3: safety net — expire any image older than this many days (still skips images in use)."
  type        = number
  default     = 90
}
