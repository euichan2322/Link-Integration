## route53_zone name 변수 추가하기
## acm domain 변수 추가하기

data "aws_route53_zone" "main" {
  name = var.domain
}

data "aws_acm_certificate" "acm" {
  provider  = aws.us-east-1
  domain    = "*.${var.domain}"
}

data "aws_cloudfront_cache_policy" "cache_policy" {
  name = "Managed-CachingOptimized"
}