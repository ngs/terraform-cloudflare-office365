resource "cloudflare_record" "mx" {
  zone_id   = var.zone_id
  name      = var.name
  value     = var.mx
  type      = "MX"
  priority  = 0
  ttl       = 3600
}

resource "cloudflare_record" "spf" {
  zone_id   = var.zone_id
  name      = var.name
  value     = "v=spf1 include:spf.protection.outlook.com -all"
  type      = "TXT"
  ttl       = 3600
}

resource "cloudflare_record" "autodiscover" {
  zone_id   = var.zone_id
  name      = "autodiscover${var.name == "@" ? "" : ".${var.name}"}"
  value     = "autodiscover.outlook.com"
  type      = "CNAME"
  ttl       = 3600
}
