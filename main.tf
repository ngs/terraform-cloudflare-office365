###################################
#
# Verification
#
###################################


resource "cloudflare_record" "txt-verify" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  value    = "${var.verify}"
  type     = "TXT"
  ttl      = 3600
}

###################################
#
# Exchange Online
#
###################################

resource "cloudflare_record" "mx-exchange" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  value    = "${var.mx}"
  type     = "MX"
  priority = 0
  ttl      = 3600
}

resource "cloudflare_record" "spf-exchange" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  value    = "v=spf1 include:spf.protection.outlook.com -all"
  type     = "TXT"
  ttl      = 3600
}

resource "cloudflare_record" "autodiscover-exchange" {
  domain   = "${var.domain}"
  name     = "autodiscover${var.name == "@" ? "" : ".${var.name}"}"
  value    = "autodiscover.outlook.com"
  type     = "CNAME"
  ttl      = 3600
}

###################################
#
# Skype for Business
#
###################################

resource "cloudflare_record" "sipdir-online-skype" {
  domain   = "${var.domain}"
  name     = "sip${var.name == "@" ? "" : ".${var.name}"}"
  value    = "sipdir.online.lync.com"
  type     = "CNAME"
  ttl      = 3600
}

resource "cloudflare_record" "webdir-online-skype" {
  domain   = "${var.domain}"
  name     = "lyncdiscover${var.name == "@" ? "" : ".${var.name}"}"
  value    = "webdir.online.lync.com"
  type     = "CNAME"
  ttl      = 3600
}

resource "cloudflare_record" "sip-tls-skype" {
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

resource "cloudflare_record" "sipfederationtls-tcp-skype" {
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

###################################
#
# Mobile Device Management for Office 365
#
###################################

resource "cloudflare_record" "mdm-registration" {
  domain   = "${var.domain}"
  name     = "enterpriseregistration${var.name == "@" ? "" : ".${var.name}"}"
  value    = "enterpriseregistration.windows.net"
  type     = "CNAME"
  ttl      = 3600
}

resource "cloudflare_record" "mdm-enrollment" {
  domain   = "${var.domain}"
  name     = "enterpriseenrollment${var.name == "@" ? "" : ".${var.name}"}"
  value    = "enterpriseenrollment.manage.microsoft.com"
  type     = "CNAME"
  ttl      = 3600
}
