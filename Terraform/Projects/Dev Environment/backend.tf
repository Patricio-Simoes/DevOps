terraform {
  backend "s3" {
    bucket  = "terraform-practise-projects"
    encrypt = true
    key     = "Simple Environment/terraform.tfstate"
    region  = "eu-central-1"
  }
}