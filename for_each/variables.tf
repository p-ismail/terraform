#Map

/* variable "instances" {
    type = map
    default = {
        mongodb = "t3.micro"
        mysql = "t3.small"
        user = "t3.micro"
        shipping = "t3.micro"

    }
  
} */


#here the list should be converted into set
variable "instances" {
    type = list
    default = ["mongodb" , "redis" ]
}

variable "zone_id"{
    default = "Z01106551FPUIUD66XELE"
  
}

variable "domain_name"{
    default = "daws70s.online"
  
}