module "main" {
  source = "../../"

  domain = "euichan.com"
  platform = "velog"
  redirect_target = "velog.io/@heueum22"

  route53_zone = "euichan.com"
}