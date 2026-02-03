# 🛠️ Create VPC and Subnet Using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📄 Task Description
**Task:** To ensure proper resource provisioning order, explicitly define the dependency between an AWS VPC and a Subnet. The objective is to create a VPC and then a Subnet that explicitly depends on it using Terraform's `depends_on` argument.

**Objectives:**
1. Create a VPC (`xfusion-vpc`) and a Subnet (`xfusion-subnet`).
2. Use `depends_on` to enforce resource creation order.
3. Use `variables.tf` for naming and `outputs.tf` for displaying results.

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Defines the VPC and Subnet resources with explicit dependency logic. |
| `variables.tf` | Declares input variables (`KKE_VPC_NAME`, `KKE_SUBNET_NAME`). |
| `provider.tf` | Configures the AWS Provider (LocalStack). |
| `outputs.tf` | Defines outputs to display the provisioned resource names. |
| `terraform.tfvars` | Assigns specific values to the declared variables. |

---

## 🚀 Solution



**Implementation Details:**
This project uses Terraform to provision network infrastructure. The key requirement is ensuring the Subnet is created strictly *after* the VPC using the `depends_on` meta-argument.

**Key Logic (`main.tf` snippet):**
```hcl
resource "aws_subnet" "xfusion_subnet" {
  # ... configuration ...
  
  # Explicitly wait for VPC creation
  depends_on = [ aws_vpc.xfusion_vpc ]
}

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