resource "aws_vpc" "r_vpc" {
    cidr_block = var.cidr_block

    tags = {
        Name = local.base_name
    }  
}

# Create public subnets
resource "aws_subnet" "r_public_subnets" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.r_vpc.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("${local.base_name}_PublicSubnet-0%d", count.index + 1)
  }
}

######################
#### Route Tables ####
######################
# Create public route table
resource "aws_route_table" "r_public_route_table" {
  vpc_id = aws_vpc.r_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.r_internet_gateway.id
  }

  tags = {
    Name = "${local.base_name}_public_rbt"
  }
}


# Subnet, Route table association
resource "aws_route_table_association" "r_public_subnets_association" {
  # for_each = {aws_subnet.r_public_subnets : subnet.id => aws_subnet.r_public_subnets[subnet.id].cidr_block}
  count = length(var.public_subnets)
  # subnet_id      = aws_subnet.r_public_subnets[*].id
  route_table_id = aws_route_table.r_public_route_table.id
  subnet_id      = element(aws_subnet.r_public_subnets.*.id, count.index)
}
