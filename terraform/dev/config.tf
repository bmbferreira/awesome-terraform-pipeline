terraform {
  required_version = ">= 0.13.5"

  required_providers {
    aws = {
      version = ">= 3.15.0"
      source  = "hashicorp/aws"
    }
  }


  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}
