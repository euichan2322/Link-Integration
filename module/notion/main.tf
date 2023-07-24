module "main" {
  source = "../../"

  domain = "euichan.com"
  platform = "notion"
  redirect_target = "euichan2322.notion.site/206b9e4a2f0e4aef99f4cfaf277fd27b?pvs=4"

  route53_zone = "euichan.com"
}