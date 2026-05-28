output "lifecycle_policy_repository_names" {
  description = "ECR repositories that received the lifecycle policy."
  value       = sort(keys(aws_ecr_lifecycle_policy.this))
}

output "lifecycle_policy_json" {
  description = "Lifecycle policy document applied to each repository."
  value       = local.lifecycle_policy
}
