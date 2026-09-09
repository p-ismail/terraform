resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
    # Here self is the special variable
   provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
   }

   provisioner "local-exec" {
    when = destroy #it will exceute the cmd before destroy
    command = "echo > inventory.ini"
   }

   provisioner "local-exec" {
    when = destroy #it will exceute the cmd before destroy
    command = "echo 'Deleting the instance'"
   }

   #Tell Terraform how to connect to the new server
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = self.public_ip
  }

    # Tell Terraform what commands to run on that server
   provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl restart nginx",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx",
    ]
    when = destroy
  }

  tags = {
    Name = "provisioners-terraform-demo"
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