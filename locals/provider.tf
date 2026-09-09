terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0" #terraform aws provided version
    }
  }
     #here we are informing the terraform store the state file in s3
   backend "s3" {
    bucket         = "ismail-remote-state-storage" # our s3 storage bucket name
    key            = "remote-state-locals.tfstate"            
    region         = "us-east-1"                                            
    encrypt        = true 
    use_lockfile = true                                   
  }
}

provider "aws" {
    region = "us-east-1"
}