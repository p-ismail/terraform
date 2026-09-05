variable "instances" {
    type = list
    default = ["mongodb" , "redis" , "mysql" , "rabbitmq" , "catalogue" , "user" , "cart" , "payment" ,"shipping" , "frontend" ]

}

variable "zone_id"{
    default = "Z01106551FPUIUD66XELE"
  
}

variable "domain_name"{
    default = "daws70s.online"
  
}