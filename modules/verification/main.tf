resource "cloudflare_record" "txt-verify" {
  domain   = "${var.domain}"
  name     = "${var.name}"
  value    = "${var.verify}"
  type     = "TXT"
  ttl      = 3600
}
