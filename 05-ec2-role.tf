#### Create IAM Role with Assume Role Policy
resource "aws_iam_role" "admin_role" {
  name = "AdminAccessRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

#### Attach AdministratorAccess policy to the role
resource "aws_iam_role_policy_attachment" "admin_access_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.admin_role.name
}
