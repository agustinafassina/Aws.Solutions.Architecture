# Edit this file: ECR repository names that receive the lifecycle policy.
# Repositories must already exist in AWS (same names, same region as provider).
locals {
  project_name = "projectname" # e.g. myapp → tf-qa-myapp-api

  repository_names = [
    "tf-qa-${local.project_name}-api",
    "tf-prd-${local.project_name}-api",

    # Add more repos as needed:
    # "tf-qa-${local.project_name}-worker",
    # "tf-prd-${local.project_name}-worker",
  ]
}
