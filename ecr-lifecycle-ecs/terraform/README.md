# Terraform — ECR lifecycle
Edit **`repositories.tf`** (repo names), then:

```bash
terraform init
terraform apply
```

| Priority | Rule | Default |
| --- | --- | --- |
| 1 | Untagged | 1 day |
| 2 | Max images | 3 |

> ECR does **not** protect images used by ECS. Size `image_count_more_than` to cover the deployed image plus your rollback window.

Optional overrides: `terraform.tfvars` (`aws_region`, rule numbers). See [`../README.md`](../README.md).
