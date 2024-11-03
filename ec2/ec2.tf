
resource "aws_instance" "r_public_ec2_instances" {
  count                       = var.public_ec2_count
  ami                         = data.aws_ami.d_AmazonLinux_amis.id
  instance_type               = "t3.micro"
  key_name                    = var.ssh_key
  subnet_id                   = var.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.r_public_default_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.r_iam_instance_profile.name
  user_data_replace_on_change = true
  associate_public_ip_address = var.public_ip
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y ruby
              yum install -y aws-cli
              cd /home/ec2-user
              aws s3 cp s3://aws-codedeploy-${var.region}/latest/install . --region ${var.region}
              chmod +x ./install
              ./install auto
              EOF

  tags = {
    Name = format("${local.base_name}-Bastionhost-0%d", count.index + 1)
  }
}