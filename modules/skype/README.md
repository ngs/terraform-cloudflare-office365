# Skype for Business - terraform-cloudflare-office365

## Usage

```hcl
module "office365_skype" {
	source   = "ngs/office365/cloudflare//modules/skype"

	domain   = "mycompany.tld"
	name     = "office"
}
```

## Inputs

| Name       | Description                                     |
| ---------- | ----------------------------------------------- |
| `domain`   | The DNS zone to add the record to               |
| `name`     | The name of the record. Use `@` for root domain |
