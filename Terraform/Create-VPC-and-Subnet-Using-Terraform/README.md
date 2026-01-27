# 🛠️ Create-VPC-and-Subnet-Using-Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📄 Task Description
**Task:** To ensure proper resource provisioning order, the DevOps team wants to explicitly define the dependency between an AWS VPC and a Subnet. The objective is to create a VPC and then a Subnet that explicitly depends on it using Terraform's depends_on argument.  Please complete the following tasks:  Create a VPC named devops-vpc.  Create a Subnet named devops-subnet.  Ensure the Subnet uses the depends_on argument to explicitly depend on the VPC resource.  Create the main.tf file (do not create a separate .tf file) to provision a VPC and Subnet.  Use variables.tf, define the following variables:  KKE_VPC_NAME for the VPC name. KKE_SUBNET_NAME for the Subnet name. Use terraform.tfvars to input the names of the VPC and subnet.  In outputs.tf, output the following:  kke_vpc_name: The name of the VPC. kke_subnet_name: The name of the Subnet. 

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Defines the resources and logic. |
| `variables.tf` | Stores configuration values. |
| `provider.tf` | Configures the AWS Provider (LocalStack). |

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