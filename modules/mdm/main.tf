resource "cloudflare_record" "registration" {
  domain   = "${var.domain}"
  name     = "enterpriseregistration${var.name == "@" ? "" : ".${var.name}"}"
  value    = "enterpriseregistration.windows.net"
  type     = "CNAME"
  ttl      = 3600
}

resource "cloudflare_record" "enrollment" {
  domain   = "${var.domain}"
  name     = "enterpriseenrollment${var.name == "@" ? "" : ".${var.name}"}"
  value    = "enterpriseenrollment.manage.microsoft.com"
  type     = "CNAME"
  ttl      = 3600
}
