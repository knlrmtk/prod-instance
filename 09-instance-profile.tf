##### Instance profile to attache role to instace
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "admin_profile"
  role = aws_iam_role.admin_role.name
}