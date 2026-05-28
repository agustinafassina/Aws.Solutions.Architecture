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
| 3 | Max age | 90 days |

Optional overrides: `terraform.tfvars` (`aws_region`, rule numbers). See [`../README.md`](../README.md).
