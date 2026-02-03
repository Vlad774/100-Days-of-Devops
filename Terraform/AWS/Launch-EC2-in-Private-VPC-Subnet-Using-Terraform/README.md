# 🛠️ Launch EC2 in Private VPC Subnet Using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

📄 Task Description
Task: The Nautilus DevOps team is expanding their AWS infrastructure and requires the setup of a private Virtual Private Cloud (VPC) along with a subnet. This configuration ensures that resources remain isolated from external networks and can only communicate within the VPC.

**Objectives:**
1. Create a VPC named xfusion-priv-vpc with CIDR block 10.0.0.0/16.
2. Create a private subnet named xfusion-priv-subnet with CIDR 10.0.1.0/24  (Auto-assign IP disabled).
3. Provision an EC2 instance named xfusion-priv-ec2 (type: t2.micro) inside the subnet.
4. Configure a Security Group allowing access only from within the VPC's CIDR block.


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

Implementation Details: The core focus of this deployment is Network Isolation. By setting map_public_ip_on_launch = false, we ensure the instance has no public footprint. Security is further hardened by a "Member-Only" Security Group rule.


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