variable "common_tags" {
    default = {
        Project = "Roboshop"
        Terraform = "true"
        Environment = "dev"
    }
  
}

variable "ec2-tags" {
    default = {
        Name = "function-demo"
        Environment ="prod"
    }
  
}

variable "sg-tags" {
    default = {
        Name = "function-demo"
    }
  
}