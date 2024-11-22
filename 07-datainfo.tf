########## Data Output of ec2 Instance Public/Privet IP addresses
data "aws_instance" "ec2info" {
  filter {
    name   = "tag:Name"
    values = ["demo-vm"]
  }
  depends_on = [aws_instance.ec2-vm]
}

output "Public_ip_address" {
  value = data.aws_instance.ec2info.public_ip
}
output "Privet_ip_address" {
  value = data.aws_instance.ec2info.private_ip
}

########### Optional: Output the Role ARN
output "admin_role_arn" {
  value = aws_iam_role.admin_role.arn
}