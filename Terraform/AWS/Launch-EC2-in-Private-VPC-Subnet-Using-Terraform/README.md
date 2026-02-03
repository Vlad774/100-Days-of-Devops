# 🛠️ Launch EC2 in Private VPC Subnet Using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?style=flat&logo=terraform) ![AWS](https://img.shields.io/badge/AWS-Infrastructure-orange?style=flat&logo=amazon-aws)

## 📄 Task Description
**Task:** The Nautilus DevOps team is expanding their AWS infrastructure and requires the setup of a private Virtual Private Cloud (VPC) along with a subnet. This VPC and subnet configuration will ensure that resources deployed within them remain isolated from external networks and can only communicate within the VPC. Additionally, the team needs to provision an EC2 instance under the newly created private VPC. This instance should be accessible only from within the VPC, allowing for secure communication and resource management within the AWS environment.  Create a VPC named xfusion-priv-vpc with the CIDR block 10.0.0.0/16.  Create a subnet named xfusion-priv-subnet inside the VPC with the CIDR block 10.0.1.0/24 and auto-assign IP option must not be enabled.  Create an EC2 instance named xfusion-priv-ec2 inside the subnet and instance type must be t2.micro.  Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block.  Create the main.tf file (do not create a separate .tf file) to provision the VPC, subnet and EC2 instance.  Use variables.tf file with the following variable names:  KKE_VPC_CIDR for the VPC CIDR block. KKE_SUBNET_CIDR for the subnet CIDR block. Use the outputs.tf file with the following variable names:  KKE_vpc_name for the name of the VPC. KKE_subnet_name for the name of the subnet. KKE_ec2_private for the name of the EC2 instance. 

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