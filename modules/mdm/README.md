# Mobile Device Management for Office 365 - terraform-cloudflare-office365

## Usage

```hcl
module "office365_mdm" {
	source   = "ngs/office365/cloudflare//modules/mdm"

	domain   = "mycompany.tld"
	name     = "office"
}
```

## Inputs

| Name       | Description                                     |
| ---------- | ----------------------------------------------- |
| `domain`   | The DNS zone to add the record to               |
| `name`     | The name of the record. Use `@` for root domain |