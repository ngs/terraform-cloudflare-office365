# terraform-cloudflare-office365

CloudFlare Terraform module for setup Office 365.


## Usage

```hcl
module "office365" {
	source   = "ngs/office365/cloudflare"

	domain   = "mycompany.tld"
	name     = "office"
	verify   = "MS=ms123456"
	mx       = "office-mycompany-tld.mail.protection.outlook.com"
}
```

## Inputs

| Name       | Description                                     |
| ---------- | ----------------------------------------------- |
| `domain`   | The DNS zone to add the record to               |
| `name`     | The name of the record. Use `@` for root domain |
| `verify`   | Domain verification key                         |
| `mx`       | Exchange MX server hostname                     |

## Author

[Atushi Nagase]

## License

MIT. See [LICENSE]

[Atushi Nagase]: https://ngs.io/
[LICENSE]: LICENSE