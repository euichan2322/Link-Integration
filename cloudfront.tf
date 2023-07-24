resource "aws_cloudfront_distribution" "main" {
  enabled     = true
  aliases     = ["${var.platform}.${var.domain}"]
  comment     = var.platform
  price_class = "PriceClass_200"
  
  origin {
    origin_id = aws_s3_bucket_website_configuration.main.website_endpoint
    domain_name = aws_s3_bucket_website_configuration.main.website_endpoint

    custom_origin_config {
      origin_protocol_policy = "http-only"

      http_port  = 80
      https_port = 443

      origin_ssl_protocols = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket_website_configuration.main.website_endpoint
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    cache_policy_id  = data.aws_cloudfront_cache_policy.cache_policy.id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn      = data.aws_acm_certificate.acm.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}