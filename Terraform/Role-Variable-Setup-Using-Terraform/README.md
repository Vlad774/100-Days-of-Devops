# 🛠️ Role-Variable-Setup-Using-Terraform

## 📄 Task Description
The Nautilus DevOps team is automating IAM role creation using Terraform to streamline permissions management. As part of this task, they need to create an IAM role with specific requirements.

For this task, create an AWS IAM role using Terraform with the following requirements:

The IAM role name iamrole_ravi should be stored in a variable named KKE_iamrole.
Note:

1. The configuration values should be stored in a variables.tf file.

2. The Terraform script should be structured with a main.tf file referencing variables.tf.
The Terraform working directory is /home/bob/terraform

---

## 🚀 Solution

Create a file named variables.tf with the following content:

variable "KKE_iamrole" {
  description = "Name of the IAM role to be created"
  type        = string
  default     = "iamrole_ravi"
}


Create a file named main.tf with the following content:

resource "aws_iam_role" "iam_role" {
  # Referencing the variable for the role name
  name = var.KKE_iamrole

  # Trust Policy (Required for IAM Roles)
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

### 📝 Execution Steps:

```bash
# 1. Switch to the working directory
cd /home/bob/terraform

# 2. Initialize Terraform (downloads the AWS provider)
terraform init

# 3. Preview the changes
terraform plan

# 4. Apply the configuration to create the role
# (Type 'yes' when prompted, or use -auto-approve)
terraform apply -auto-approve

# 5. Verify the role creation using AWS CLI
aws iam get-role --role-name iamrole_ravi
```
