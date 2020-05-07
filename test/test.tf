resource "cloudflare_zone" "example" {
  zone = "example.com"
}

module "test-ghpage" {
  zone_id  = cloudflare_zone.example.id
  source   = "../"
	name     = "office"
	verify   = "MS=ms123456"
	mx       = "office-mycompany-tld.mail.protection.outlook.com"
}

