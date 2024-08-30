
data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name

}

# create a record set in route 53
resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name    = aws_lb.load-balancer.dns_name
    zone_id = aws_lb.load-balancer.zone_id
    //zone_id                = var.application_load_balancer_zone_id
    evaluate_target_health = true
  }
}

