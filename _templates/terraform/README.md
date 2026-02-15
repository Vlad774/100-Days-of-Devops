# [Task Name]

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📋 Task Description

[Describe the task as it arrived — from a ticket, a team request, or an incident.]

## 🏗️ Architecture & Logic


## 🧠 Why This Approach (Key Decisions)


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
