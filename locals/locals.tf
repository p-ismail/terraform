locals {
  instance_name = "${var.name}-${var.environment}" #here locals-dev
  instance_type = "t3.micro"
  common_tags = {
            Project = "Roboshop"
            Terraform = "true"
            Environment = "dev"
  }
  ec2_final_tags = merge(local.common_tags, var.ec2-tags)
  aws_ami = data.aws_ami.joindevops.id
}