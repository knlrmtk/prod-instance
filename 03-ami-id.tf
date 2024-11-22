####################### Find AMI id of Ubuntu #######################
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Ubuntu's official AWS account ID
  filter {
    name   = "name"
    values = ["ubuntu-*"]
  }
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}
