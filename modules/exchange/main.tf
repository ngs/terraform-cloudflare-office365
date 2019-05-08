resource "cloudflare_record" "mx" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  value    = "${var.mx}"
  type     = "MX"
  priority = 0
  ttl      = 3600
}

resource "cloudflare_record" "spf" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  value    = "v=spf1 include:spf.protection.outlook.com -all"
  type     = "TXT"
  ttl      = 3600
}

resource "cloudflare_record" "autodiscover" {
  domain   = "${var.domain}"
  name     = "autodiscover${var.name == "@" ? "" : ".${var.name}"}"
  value    = "autodiscover.outlook.com"
  type     = "CNAME"
  ttl      = 3600
}
