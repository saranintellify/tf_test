# Doc reference main : https://registry.terraform.io/providers/hashicorp/aws/latest/docs 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

provider "aws" {
    region = "${var.intellify_region}"
}

terraform {
  required_version = ">= 1.0.0"
}
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name  = var.vpc_name
    Owner = "saran"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table#argument-reference
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.myvpc.id

}

resource "aws_route_table_association" "associate_public_route_to_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_vpc.myvpc.main_route_table_id
} 

resource "aws_route_table_association" "associate_private_route_to_subnet" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
} 

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.public_subnet
  tags = {
    Name  = "public_subnet_saran"
    Owner = "saran"
  }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.private_subnet
  tags = {
    Name  = "private_subnet_saran"
    Owner = "saran"
  }
}



