resource "cloudflare_record" "txt-verify" {
  zone_id  = var.zone_id
  name     = var.name
  value    = var.verify
  type     = "TXT"
  ttl      = 3600
}
