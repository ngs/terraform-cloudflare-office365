resource "cloudflare_dns_record" "sipdir-online" {
  zone_id = var.zone_id
  name    = "sip${var.name == "@" ? "" : ".${var.name}"}"
  content = "sipdir.online.lync.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_dns_record" "webdir-online" {
  zone_id = var.zone_id
  name    = "lyncdiscover${var.name == "@" ? "" : ".${var.name}"}"
  content = "webdir.online.lync.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_dns_record" "sip-tls" {
  zone_id = var.zone_id
  name    = "_sip._tls.${var.name == "@" ? "" : "${var.name}."}"
  type    = "SRV"
  ttl     = 3600

  data = {
    priority = 100
    weight   = 1
    port     = 443
    target   = "sipdir.online.lync.com"
  }
}

resource "cloudflare_dns_record" "sipfederationtls-tcp" {
  zone_id = var.zone_id
  name    = "_sipfederationtls._tcp.${var.name == "@" ? "" : "${var.name}."}"
  type    = "SRV"
  ttl     = 3600

  data = {
    priority = 100
    weight   = 1
    port     = 5061
    target   = "sipfed.online.lync.com"
  }
}
