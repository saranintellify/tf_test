# https://github.com/terraform-aws-modules/terraform-aws-ec2-instance

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.intellify_region
}

module "Deploy_VPC" {
  source = "../Deploy_VPC/"
}

module "my_ec2_instance" {
  source        = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  ami           = "ami-0aab712d6363da7f9"
  instance_type = "t2.micro"
  name          = "test-ec2-saran"
  key_name      = "saran"
  subnet_id     = module.Deploy_VPC.out_vpc_public_subnet
}

