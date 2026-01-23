resource "aws_iam_policy" "my_policy" {
  name = var.KKE_iampolicy

  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "*"       
        Effect   = "Allow"   
        Resource = "*"       
      },
    ]
  })
}