resource "aws_route53_record" "www" {
 count = 10
  zone_id = var.zone_id
  #here we are adding two variables and one extra character(.) called as interpolation
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.daws70s.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[count.index].private_ip]
}