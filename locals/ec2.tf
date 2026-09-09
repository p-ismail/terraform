resource "aws_instance" "example" {
  ami           = local.aws_ami
  instance_type = local.instance_type

   vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = local.instance_name
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" { #here the name reference for terraform
  name        = "allow-all-terraform" #here name reference for aws
  description = "Allow TLS inbound traffic and all outbound traffic"

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}