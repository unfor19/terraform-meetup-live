module "terraform_state_backend" {
  # bucket_name = namespace-stage-name-attributes
  source     = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.17.0"
  namespace  = "my-vpc"
  stage      = "Development"
  name       = "terraform"
  attributes = ["state"]
  region     = "eu-west-1"
}
