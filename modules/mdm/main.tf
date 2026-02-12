resource "cloudflare_dns_record" "registration" {
  zone_id = var.zone_id
  name    = "enterpriseregistration${var.name == "@" ? "" : ".${var.name}"}"
  content = "enterpriseregistration.windows.net"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_dns_record" "enrollment" {
  zone_id = var.zone_id
  name    = "enterpriseenrollment${var.name == "@" ? "" : ".${var.name}"}"
  content = "enterpriseenrollment.manage.microsoft.com"
  type    = "CNAME"
  ttl     = 3600
}
