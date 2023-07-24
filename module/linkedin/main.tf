module "main" {
  source = "../../"

  domain = "euichan.com"
  platform = "linkedin"
  redirect_target = "www.linkedin.com/in/euichan"

  route53_zone = "euichan.com"
}