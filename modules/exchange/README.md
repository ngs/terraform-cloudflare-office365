# Exchange Online - terraform-cloudflare-office365

## Usage

```hcl
module "office365_exchange" {
	source   = "ngs/office365/cloudflare//modules/exchange"

	domain   = "mycompany.tld"
	name     = "office"
	mx       = "office-mycompany-tld.mail.protection.outlook.com"
}
```

## Inputs

| Name       | Description                                     |
| ---------- | ----------------------------------------------- |
| `domain`   | The DNS zone to add the record to               |
| `name`     | The name of the record. Use `@` for root domain |
| `mx`       | Exchange MX server hostname                     |