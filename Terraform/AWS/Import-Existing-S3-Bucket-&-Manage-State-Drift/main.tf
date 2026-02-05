resource "aws_s3_bucket" "ghost" {
  bucket = "my-ghost-bucket-13744"  # Replace with your actual bucket name

  # Tags are synchronized with the actual state found in AWS
  tags = {
    ManagedBy   = "Terraform"
    Environment = "Production"
  }
}