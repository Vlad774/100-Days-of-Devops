# <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg" width="40" height="40" align="center"/> Terraform Infrastructure as Code

Welcome to the Terraform section of my DevOps journey. Here I document Infrastructure as Code (IaC) solutions for AWS and local providers.

## 📂 Solved Tasks

| Task | Description | Status | Key Skills | Solution |
|------|-------------|--------|------------|----------|
| **User Variable Setup Using Terraform** | 📄 *See details inside* | ✅ Done | `Terraform, Variables` | [View Solution](./User-Variable-Setup/) |
| **Role-Variable-Setup-Using-Terraform** | Automating IAM Role creation with variables. | ✅ Done | `Terraform, IAM, Variables` | [View Solution](./Role-Variable-Setup-Using-Terraform/) |
| **Policy-Variable-Setup-Using-Terraform** | Automating IAM Policy creation with variables. | ✅ Done | `Terraform, IAM, Variables` | [View Solution](./Policy-Variable-Setup-Using-Terraform/) |
| **Create-VPC-and-Subnet-Using-Terraform** | Managing explicit dependencies with depends_on. | ✅ Done | `Terraform, VPC, Subnet` | [View Solution](./Create-VPC-and-Subnet-Using-Terraform/) |
| **Launch EC2 in Private VPC Subnet Using Terraform** | The Nautilus DevOps team is expanding their AWS infrastructure and requires the setup of a private Virtual Private Cloud (VPC) along with a subnet. This VPC and subnet configuration will ensure that resources deployed within them remain isolated from external networks and can only communicate within the VPC. Additionally, the team needs to provision an EC2 instance under the newly created private VPC. This instance should be accessible only from within the VPC, allowing for secure communication and resource management within the AWS environment.  Create a VPC named xfusion-priv-vpc with the CIDR block 10.0.0.0/16.  Create a subnet named xfusion-priv-subnet inside the VPC with the CIDR block 10.0.1.0/24 and auto-assign IP option must not be enabled.  Create an EC2 instance named xfusion-priv-ec2 inside the subnet and instance type must be t2.micro.  Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block.  Create the main.tf file (do not create a separate .tf file) to provision the VPC, subnet and EC2 instance.  Use variables.tf file with the following variable names:  KKE_VPC_CIDR for the VPC CIDR block. KKE_SUBNET_CIDR for the subnet CIDR block. Use the outputs.tf file with the following variable names:  KKE_vpc_name for the name of the VPC. KKE_subnet_name for the name of the subnet. KKE_ec2_private for the name of the EC2 instance.  | ✅ Done | `AWS` | [View Solution](./AWS/Launch-EC2-in-Private-VPC-Subnet-Using-Terraform/) |
---

*This table is automatically updated by GitHub Actions.*
