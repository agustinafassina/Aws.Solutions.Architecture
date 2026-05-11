# ☁️ AWS infrastructure diagrams

A repository of **images** with **Amazon Web Services (AWS)** architecture diagrams: a visual reference from simpler regional stacks to broader **security and service** views. Each topic lives in its **own folder** with a short **README** (what the drawing shows, links to the image, and any tables or notes).

This repo does **not** include deployment code or infrastructure-as-code—only exported diagrams (for example JPG, PNG, or SVG) and documentation beside them.

## 📂 Current contents

| Folder | Diagram | README |
| ------ | ------- | ------ |
| 🏗️ [`complete-infrastructure/`](./complete-infrastructure/) | [`infrastructure-aws.jpg`](./complete-infrastructure/infrastructure-aws.jpg) | [README](./complete-infrastructure/README.md) — ALB, WAF, ECS/Docker, ECR, path routing (`/api`, `/api/v2`), CloudWatch, CloudTrail, S3 logging. |
| 🛡️ [`complete-infra-with-services-security/`](./complete-infra-with-services-security/) | [`infrastructure-security-aws.jpg`](./complete-infra-with-services-security/infrastructure-security-aws.jpg) | [README](./complete-infra-with-services-security/README.md) — layered security (Shield, GuardDuty, WAF, Inspector, Macie, Config, Security Hub, etc.) and a **service ↔ control** matrix. |

### Previews

**[Complete AWS infrastructure](./complete-infrastructure/README.md)**  
![Complete AWS infrastructure](./complete-infrastructure/infrastructure-aws.jpg)

**[Infrastructure + security services](./complete-infra-with-services-security/README.md)**  
![Infrastructure and security on AWS](./complete-infra-with-services-security/infrastructure-security-aws.jpg)

## 📁 Organizing new diagrams
Suggested conventions as you add more:

- **One folder per diagram (or family):** keep the image, a `README.md`, and any variants together—same pattern as the folders above.
- **Clear names:** include context (environment, region, or purpose) and, when useful, `simple` / `complete` or a version in the filename, for example `prod-multi-az-v2.jpg`.
- **Format:** JPG or PNG for exports; SVG when your tool supports it and you want lossless scaling.
- **Group when it grows:** optional subfolders by type (`simple/`, `complete/`) or domain (`network/`, `data/`, `observability/`).

Update this root README when you add a new top-level folder, or link straight to files from the repository tree.

## 🛠️ Common tools
Diagrams are often built with [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/), [draw.io / diagrams.net](https://www.diagrams.net/), Lucidchart, Miro, or other tools that work with the official AWS icons.

## ⚖️ License
Images are for personal use. AWS icons and marks are subject to the [AWS Trademark Guidelines](https://aws.amazon.com/legal/trademark-guidelines/).
