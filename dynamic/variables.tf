variable "ingress_rules" {
    default = [
        {
            port = 22
            cidr_blocks =["0.0.0.0/0"]
            description = "allowing port 22 from internet "
        },
        {
            port = 443
            cidr_blocks =["0.0.0.0/0"]
            description = "allowing port 443 from internet "
        },
         {
            port = 3306
            cidr_blocks =["0.0.0.0/0"]
            description = "allowing port 3306 from internet "
        }
        
    ]
  
}