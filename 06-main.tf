######## creating ec2 instance ##########
resource "aws_instance" "ec2-vm" {
  ami           = "ami-0e1d06225679bc1c5"
  instance_type = "t2.micro"
  count         = 1
  key_name      = aws_key_pair.ec2user.key_name
  //key_name = "ec2user"
  //iam_instance_profile = data.aws_iam_instance_profile.existing_role.name
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
  }
  user_data = file("config.sh")
  tags = {
    Name = "demo-vm"
  }
}

//resource "aws_key_pair" "ec2user" {
//  key_name   = "ec2user"
//  public_key = file("${path.module}/ec2-user")
//}