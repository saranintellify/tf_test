# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
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

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "sg_for_ssh" {
  name        = "test-sg-saran"
  description = "for tf testing"
  vpc_id      = module.Deploy_VPC.out_vpc_id
  ingress = [
    {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "all"
      cidr_blocks      = ["58.178.18.179/32"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = true
    }
  ]
  egress = [
    {
      description      = "Allow outgoing"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = true
    }
  ]
  tags = {
    owner   = "saran"
    purpose = "terraform training"
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0aab712d6363da7f9"
  instance_type = "t2.micro"

  key_name  = "saran"
  subnet_id = module.Deploy_VPC.out_vpc_public_subnet
  tags = {
    Name    = "test-ec2-saran"
    owner   = "saran"
    purpose = "terraform training"
  }
}

