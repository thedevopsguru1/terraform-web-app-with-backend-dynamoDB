resource "aws_route53_record" "api" {
  name    = aws_acm_certificate.api.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.public.zone_id
  alias {
    name                   = aws_lb.my_app_eg1.dns_name
    zone_id                = aws_lb.my_app_eg1.zone_id
    evaluate_target_health = false
  }
}