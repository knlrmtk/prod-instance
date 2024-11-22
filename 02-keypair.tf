########### Creation of key pair ############
resource "aws_key_pair" "ec2user" {
  key_name   = "ec2user"
  public_key = file("${path.module}/ec2-user-pub")
}