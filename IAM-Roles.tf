
# IAM Role for EC2 instances

resource "aws_iam_role" "ec2_s3_access_role" {
  name = var.iam-role-name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy that grants access to the S3 bucket
resource "aws_iam_policy" "s3_access_policy" {
  name        = var.ec2-s3-access-policy-name
  description = "Policy to allow EC2 instances to access S3 bucket for backups and logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket-name}",
          "arn:aws:s3:::${var.bucket-name}/*"
        ]
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "ec2_s3_access_policy_attachment" {
  role       = aws_iam_role.ec2_s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

# Instance profile for the IAM role
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_s3_access_profile"
  role = aws_iam_role.ec2_s3_access_role.name
}
