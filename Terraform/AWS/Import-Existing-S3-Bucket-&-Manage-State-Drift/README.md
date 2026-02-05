# 🛠️ Import Existing S3 Bucket & Manage State Drift

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📄 Task Description
**Task:** The Nautilus DevOps team discovered an S3 bucket that was created manually via the AWS CLI by a junior developer. This bucket is currently unmanaged and exists outside of the Terraform state. Additionally, crucial tags were added manually to the bucket in the AWS Console, creating a configuration drift.  

## Objectives:  
1. Bring the existing S3 bucket under Terraform management without recreating it.  
2. Detect and reconcile the configuration drift (manual tags) using safe state refresh strategies.  
3. Ensure the infrastructure code (main.tf) matches the real-world state. 

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

```bash
resource "aws_s3_bucket" "ghost" {
  bucket = "my-ghost-bucket-13744"  # Replace with your actual bucket name

  # Tags are synchronized with the actual state found in AWS
  tags = {
    ManagedBy   = "Terraform"
    Environment = "Production"
  }
}
```

### 📝 Execution Steps

```bash
1. Initialization
Prepare the working directory and download providers.


terraform init
2. Import Existing Resources
The bucket already exists in AWS. We import it into the state file to prevent BucketAlreadyExists errors.



# Syntax: terraform import <RESOURCE_ADDRESS> <AWS_ID>
terraform import aws_s3_bucket.ghost my-ghost-bucket-13744
3. Drift Detection (Safe Refresh)
Detect changes made manually (e.g., tags added via CLI) without modifying infrastructure.



# Check for drift and update state only
terraform plan -refresh-only

# Approve the state update
terraform apply -refresh-only -auto-approve
4. Verification
Ensure the code matches the state and no further changes are required.



terraform plan
# Expected Output: "No changes. Your infrastructure matches the configuration."