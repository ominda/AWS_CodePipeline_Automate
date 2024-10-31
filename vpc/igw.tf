# Create Internet Gateway
resource "aws_internet_gateway" "r_internet_gateway" {
  vpc_id = aws_vpc.r_vpc.id

  tags = {
    Name = "${local.base_name}"
  }
}
