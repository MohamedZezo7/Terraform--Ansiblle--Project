terraform {
  backend "s3" {
    bucket = "statefile-terraform-z"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}