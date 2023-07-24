module "main" {
  source = "../../"

  domain = "euichan.com"
  platform = "github"
  redirect_target = "https://github.com/euichan2322"

  route53_zone = "euichan.com"
}