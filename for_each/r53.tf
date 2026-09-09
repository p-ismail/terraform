resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id = var.zone_id
  #here we are adding two variables and one extra character(.) called as interpolation
  name    = "${each.key}.${var.domain_name}" #mongodb.daws70s.online
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

#as part of functions

resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id = var.zone_id
  #here we are adding two variables and one extra character(.) called as interpolation
  name    = "roboshop.${var.domain_name}" #roboshop.daws70s.online
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.example,"frontend").public_ip]
  #here lookup is function
  allow_overwrite = true
}