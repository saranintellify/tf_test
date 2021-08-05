output "out_vpc_id" {
  description = "The ID of the VPC created"
  value       = aws_vpc.myvpc.id
}

output "out_vpc_route_table" {
  description = "Route table of VPC"
  value       = aws_vpc.myvpc.main_route_table_id
}

output "out_igw" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "out_vpc_public_subnet" {
  description = "Subnet groups in the vpc"
  value       = aws_subnet.public_subnet.id
}

output "out_vpc_private_subnet" {
  description = "Subnet groups in the vpc"
  value       = aws_subnet.private_subnet.id
}




