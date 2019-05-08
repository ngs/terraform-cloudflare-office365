# terraform-cloudflare-office365

ref: [Add a TXT or MX record for verification](https://docs.microsoft.com/en-us/office365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider?view=o365-worldwide#add-a-txt-or-mx-record-for-verification)


## Usage

```hcl
module "office365_verification" {
	source   = "ngs/office365/cloudflare//modules/verification"

	domain   = "mycompany.tld"
	name     = "office"
	verify   = "MS=ms123456"
}
```

## Inputs

| Name       | Description                                     |
| ---------- | ----------------------------------------------- |
| `domain`   | The DNS zone to add the record to               |
| `name`     | The name of the record. Use `@` for root domain |
| `verify`   | Domain verification key                         |