provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "project_user" {
  name = var.KKE_user
}