terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0" #terraform aws provided version
    }
  }
}

provider "aws" {
    region = "us-east-1"
}