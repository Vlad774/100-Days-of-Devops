# [Task Name]

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📋 Task Description

[Describe the task as it arrived — from a ticket, a team request, or an incident.]

## 🏗️ Architecture & Logic

[What gets created and how the components relate to each other. ASCII diagram is fine.]

```
VPC (10.0.0.0/16)
└── Subnet (10.0.1.0/24)
    └── EC2 instance
```

## 🧠 Why This Approach (Key Decisions)

- **Why explicit `depends_on` instead of implicit** — Terraform can infer dependencies on its own, but an explicit `depends_on` makes the intent obvious during code review.
- **Why variables instead of hardcoded values** — configuration can be reused without touching the code; values change through `tfvars`.
- **[Add your own decision]** — explain the key choice specific to this task.

## 🛠️ Tech Stack

- **Tool:** Terraform
- **Provider:** AWS (LocalStack)
- **Version:** ~> 5.0

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Resources and logic |
| `variables.tf` | Input variables |
| `provider.tf` | AWS provider configuration (LocalStack) |
| `outputs.tf` | Values exposed after apply |
| `terraform.tfvars` | Variable values (listed in .gitignore) |

## 🚀 How to Run

```bash
# Initialize providers
terraform init

# Validate syntax
terraform validate

# Preview changes
terraform plan

# Apply
terraform apply -auto-approve

# Verify created resources
terraform state list
```
