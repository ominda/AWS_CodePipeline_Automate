data "aws_availability_zones" "available" {}

data "aws_ami" "d_AmazonLinux_amis" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.6*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}