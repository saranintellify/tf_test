
data "terraform_remote_state" "my-s3-backend" {
  backend = "s3" 
  config =  {
    profile = "intellify"
    bucket  = "intellify-saran-dev"
    key     = "terraform/remotestate/terraform.tfstate"
    region  = "ap-southeast-2"
  }
}
