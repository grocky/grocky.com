terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "grocky-tfstate"
    dynamodb_table = "tfstate-lock"
    region         = "us-east-1"
    key            = "www.grocky.com/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "root" {
  backend = "s3"
  config = {
    bucket = "grocky-tfstate"
    region = "us-east-1"
    key    = "grocky.com/terraform.tfstate"
  }
}

variable "root_domain_name" {
  default = "grocky.com"
}

variable "www_domain_name" {
  default = "www.grocky.com"
}

