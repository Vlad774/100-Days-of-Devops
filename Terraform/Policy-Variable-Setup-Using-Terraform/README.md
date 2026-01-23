# 🛠️ AWS IAM Policy Automation with Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-IAM-orange?style=flat&logo=amazon-aws)

## 📄 Project Description
This project automates the creation of AWS IAM Policies using **Terraform**.
The goal is to demonstrate **Infrastructure as Code (IaC)** best practices by separating configuration (variables) from the resource logic.

**Scenario:**
The Nautilus DevOps team needs to enhance security by automating access management. Specifically, we are creating an IAM policy where the policy name is dynamically injected via a variable.

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Defines the `aws_iam_policy` resource and links it to the variable. |
| `variables.tf` | Stores the configuration values (e.g., policy name). |
| `provider.tf` | Configures the AWS Provider (region, credentials). |

---

## 🚀 Solution

### 1. Variables (`variables.tf`)
We define the variable `KKE_iampolicy` to store the policy name. This makes the code reusable.

```hcl
variable "KKE_iampolicy" {
  type    = string
  default = "iampolicy_yousuf"
}
```
### 2. Main.tf
```hcl
resource "aws_iam_policy" "my_policy" {
  name = var.KKE_iampolicy

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
```


### 📝 Execution Steps:

```bash
terraform init

terraform validate

terraform plan

terraform apply

terraform state list
# Output: aws_iam_policy.my_policy
```
