module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  #region = "ap-southeast-2"
  name = "test-vpc-saran"
  cidr = "10.3.0.0/16"

  azs             = ["ap-southeast-2a", "ap-southeast-2b"]
  private_subnets = ["10.3.1.0/24"]
  public_subnets  = ["10.3.4.0/24"]

  enable_nat_gateway = true
   single_nat_gateway = true
   one_nat_gateway_per_az = false
  tags = {
    Owner = "saran"
    purpose = "terraform-training"
  }
}