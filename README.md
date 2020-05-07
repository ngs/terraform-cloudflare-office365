# terraform-cloudflare-office365

CloudFlare Terraform module for setup Office 365.

## Usage

```hcl
resource "cloudflare_zone" "example" {
  zone = "example.com"
}

module "office365" {
	source   = "ngs/office365/cloudflare"

  zone_id  = cloudflare_zone.example.id
	name     = "office"
	verify   = "MS=ms123456"
	mx       = "office-mycompany-tld.mail.protection.outlook.com"
}
```

## Inputs

| Name     | Description                                     |
| -------- | ----------------------------------------------- |
| `domain` | The DNS zone to add the record to               |
| `name`   | The name of the record. Use `@` for root domain |
| `verify` | Domain verification key                         |
| `mx`     | Exchange MX server hostname                     |

## Author

[Atushi Nagase]

## License

MIT. See [LICENSE]

[atushi nagase]: https://ngs.io/
[license]: LICENSE
