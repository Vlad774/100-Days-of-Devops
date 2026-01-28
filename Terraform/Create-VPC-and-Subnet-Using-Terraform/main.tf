resource "aws_vpc" "xfusion_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.KKE_VPC_NAME
  }
}

resource "aws_subnet" "xfusion_subnet" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.xfusion_vpc.id

  tags = {
    Name = var.KKE_SUBNET_NAME
  }

  depends_on = [aws_vpc.xfusion_vpc]
}