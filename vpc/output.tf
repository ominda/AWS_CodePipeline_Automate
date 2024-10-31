output "o_vpc" {
    value = aws_vpc.r_vpc
}

output "o_public_subnet_ids" {
    value = aws_subnet.r_public_subnets  
}