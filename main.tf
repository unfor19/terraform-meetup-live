provider "aws" {
  region = "eu-west-1" # Ireland

  # env vars - AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY

  # access_key = "my_key"
  # secret_key = "my_secret"
  
  # aws config
  #profile = "default"
}

terraform {
  # define the required terraofrm version
  required_version = "~>0.12.0" # >=0.12 and <0.13


  # declare the remote backend (if needed)
  # .terraform.state
  # here you can't use variables or local variables
  backend "s3" {
    dynamodb_table = "my-vpc-development-terraform-state-lock"
    bucket = "my-vpc-development-terraform-state"
    region = "eu-west-1"
    key = "terraform.tfstate"
    encrypt = true
  }

}