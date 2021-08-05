terraform {
  backend "s3" {
    profile = "intellify"
    bucket  = "intellify-saran-dev"
    key     = "terraform/remotestate/terraform.tfstate"
    region  = "ap-southeast-2"
  }
}
