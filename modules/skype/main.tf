resource "cloudflare_record" "sipdir-online" {
  domain   = "${var.domain}"
  name     = "sip${var.name == "@" ? "" : ".${var.name}"}"
  value    = "sipdir.online.lync.com"
  type     = "CNAME"
  ttl      = 3600
}

resource "cloudflare_record" "webdir-online" {
  domain   = "${var.domain}"
  name     = "lyncdiscover${var.name == "@" ? "" : ".${var.name}"}"
  value    = "webdir.online.lync.com"
  type     = "CNAME"
  ttl      = 3600
}

resource "cloudflare_record" "sip-tls" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  type     = "SRV"

  data = {
    service  = "_sip"
    proto    = "_tls"
    name     = "${var.name}"
    priority = 100
    weight   = 1
    port     = 443
    target   = "sipdir.online.lync.com"
  }
}

resource "cloudflare_record" "sipfederationtls-tcp" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  type     = "SRV"

  data = {
    service  = "_sipfederationtls"
    proto    = "_tcp"
    name     = "${var.name}"
    priority = 100
    weight   = 1
    port     = 5061
    target   = "sipfed.online.lync.com"
  }
}