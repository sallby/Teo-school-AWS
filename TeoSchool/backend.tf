terraform {
  backend "s3" {
    bucket         = "stdjiby"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-lock"
  }
}
