


data "aws_acm_certificate" "amazon_issued" {
  domain      = "*.temtagroup.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}