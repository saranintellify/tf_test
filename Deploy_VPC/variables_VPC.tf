variable "intellify_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "vpc_name" {
  type    = string
  default = "training-vpc-saran"
}

variable "vpc_cidr" {
  default = "10.3.0.0/16"
}

variable "public_subnet" {
    default = "10.3.1.0/24"
}
variable "private_subnet" {
    default = "10.3.2.0/24"
}