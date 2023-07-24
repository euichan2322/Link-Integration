variable "platform" {
  type = string
  description = "your platform name. notion, linkedin, velog ..."
}

variable "domain" {
  type = string
  description = "your domain"
}

variable "redirect_target" {
  type = string
  description = "Link including the path you want to redirect         ex)www.linkedin.com/in/euichan"
}

variable "route53_zone" {
  type = string
  description = "route53 zone name"
}