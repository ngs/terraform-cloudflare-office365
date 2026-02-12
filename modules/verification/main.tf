resource "cloudflare_dns_record" "txt-verify" {
  zone_id = var.zone_id
  name    = var.name
  content = var.verify
  type    = "TXT"
  ttl     = 3600
}
