variable "account_id" {
  type    = string
  default = "example-account-id"
}

resource "cloudflare_zone" "example" {
  name    = "example.com"
  account = { id = var.account_id }
}

module "test-ghpage" {
  zone_id = cloudflare_zone.example.id
  source  = "../"
  name    = "office"
  verify  = "MS=ms123456"
  mx      = "office-mycompany-tld.mail.protection.outlook.com"
}
