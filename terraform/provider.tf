provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "de-terraform-s3-20240201110406375100000001"
    key    = "terraform/tfstate"
    region = "eu-west-2"
  }
}
