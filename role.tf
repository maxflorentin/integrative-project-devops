resource "aws_iam_role" "ec2_role_me" {
  name = "ec2_role_me"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["ec2.amazonaws.com", "eks.amazonaws.com"]
        }
      },
    ]
    },
  )

  tags = {
    Terraform   = true
    Environment = "sandbox"
  }
}

resource "aws_iam_instance_profile" "sandbox_me" {
  name = "sandbox_me"
  role = aws_iam_role.ec2_role_me.name
}
