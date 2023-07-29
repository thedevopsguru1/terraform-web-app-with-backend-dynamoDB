resource "aws_acm_certificate" "api" {
  domain_name       = "app.anaeleboo.com"
  validation_method = "DNS"
  
}