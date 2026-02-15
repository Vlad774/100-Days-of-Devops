locals {
  # Shared tags applied to all resources in this task.
  # Usage: tags = local.common_tags
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# Resources go here.
# Example structure:
#
# resource "aws_vpc" "main" {
#   cidr_block = var.vpc_cidr
#
#   tags = merge(local.common_tags, {
#     Name = "${var.project_name}-vpc"
#   })
# }
