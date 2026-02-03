# 1.VPC
resource "aws_vpc" "xfusion-priv-vpc" {
  cidr_block = var.KKE_VPC_CIDR
  tags = {
    Name = "xfusion-priv-vpc"
  }
}


resource "aws_subnet" "xfusion-priv-subnet" {
  vpc_id                  = aws_vpc.xfusion-priv-vpc.id
  cidr_block              = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false 
  tags = {
    Name = "xfusion-priv-subnet"
  }
}

#  Security Group 
resource "aws_security_group" "xfusion-sg" {
  name        = "xfusion-priv-sg"
  vpc_id      = aws_vpc.xfusion-priv-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 4. EC2 
resource "aws_instance" "xfusion-priv-ec2" {
  ami                    = "ami-0c55b159cbfafe1f0" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.xfusion-priv-subnet.id
  vpc_security_group_ids = [aws_security_group.xfusion-sg.id]

  tags = {
    Name = "xfusion-priv-ec2"
  }
}