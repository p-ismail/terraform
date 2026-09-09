variable "name" {
    type = string
    default = "locals"
  
}

variable "environment" {
    type = string
    default = "dev"
}


variable "ec2-tags" {
    default = {
        Name = "locals-demo"
        Environment ="prod"
    }
}

variable "sg-tags" {
    default = {
        Name = "locals-demo"
    }
}