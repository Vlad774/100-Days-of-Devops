# 🛠️ Import Existing S3 Bucket & Manage State Drift

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📄 Task Description
**Task:** The Nautilus DevOps team discovered an S3 bucket that was created manually via the AWS CLI by a junior developer. This bucket is currently unmanaged and exists outside of the Terraform state. Additionally, crucial tags were added manually to the bucket in the AWS Console, creating a configuration drift.  Objectives:  Bring the existing S3 bucket under Terraform management without recreating it.  Detect and reconcile the configuration drift (manual tags) using safe state refresh strategies.  Ensure the infrastructure code (main.tf) matches the real-world state. 

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Defines the resources and logic. |
| `variables.tf` | Stores configuration values. |
| `provider.tf` | Configures the AWS Provider (LocalStack). |
| `outputs.tf` | Defines outputs to display the provisioned resource names. |
| `terraform.tfvars` | Assigns specific values to the declared variables. |

---

## 🚀 Solution

### 📝 Execution Steps

```bash
# 1. Initialize
terraform init

# 2. Validate
terraform validate

# 3. Plan
terraform plan

# 4. Apply
terraform apply -auto-approve

# 5. Verify
terraform state list