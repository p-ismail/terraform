variable "instances" {
    type = list
    default = ["mongodb" , "redis" , "mysql" , "rabbitmq" , "catalogue" , "user" , "cart" , "payment" ,"shipping" , "frontend" ]
  
}