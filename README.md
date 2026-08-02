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

| Name      | Description                                     |
| --------- | ----------------------------------------------- |
| `zone_id` | The DNS zone ID to add the record to            |
| `name`    | The name of the record. Use `@` for root domain |
| `verify`  | Domain verification key                         |
| `mx`      | Exchange MX server hostname                     |

## Submodules

| Module                                  | Records                                              |
| --------------------------------------- | ---------------------------------------------------- |
| [`exchange`](modules/exchange)          | MX, SPF, autodiscover                                |
| [`mdm`](modules/mdm)                    | enterpriseregistration, enterpriseenrollment         |
| [`teams`](modules/teams)                | `_sipfederationtls._tcp` SRV                         |
| [`verification`](modules/verification)  | Domain ownership TXT                                 |

## Upgrading to v1

`skype` is now `teams`, and it creates one record instead of four. Skype for
Business Online has been retired, so Teams-only tenants no longer need the
`sip` and `lyncdiscover` CNAMEs or the `_sip._tls` SRV record. See
[External Domain Name System records for Microsoft 365][dns-records].

Applying the upgrade deletes those three records. Move the surviving record in
state first so it is not recreated:

```sh
terraform state mv \
  'module.office365.module.skype.cloudflare_dns_record.sipfederationtls-tcp' \
  'module.office365.module.teams.cloudflare_dns_record.sipfederationtls-tcp'
```

Check that nothing still depends on Skype for Business — on-premises hybrid
deployments and old clients do use those records. Hybrid tenants should follow
[DNS implications for on-premises organizations that become hybrid][hybrid].

## Author

[Atushi Nagase]

## License

MIT. See [LICENSE]

[atushi nagase]: https://ngs.io/
[license]: LICENSE

[dns-records]: https://learn.microsoft.com/en-us/microsoft-365/enterprise/external-domain-name-system-records
[hybrid]: https://learn.microsoft.com/en-us/skypeforbusiness/hybrid/configure-hybrid-connectivity#dns-implications-for-on-premises-organizations-that-become-hybrid
