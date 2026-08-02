# Microsoft Teams - terraform-cloudflare-office365

Creates the federation SRV record Microsoft Teams needs.

Replaces the `skype` module. Skype for Business Online has been retired, and
Teams-only tenants no longer need the `sip` and `lyncdiscover` CNAMEs or the
`_sip._tls` SRV record. See
[External Domain Name System records for Microsoft 365][dns-records].

If your organisation does not federate with external SIP systems, you can drop
this record too.

## Usage

```hcl
module "office365_teams" {
  source = "ngs/office365/cloudflare//modules/teams"

  zone_id = cloudflare_zone.example.id
  name    = "office"
}
```

## Inputs

| Name      | Description                                     |
| --------- | ----------------------------------------------- |
| `zone_id` | The DNS zone ID to add the record to            |
| `name`    | The name of the record. Use `@` for root domain |

## Records

| Type  | Name                            | Value                         |
| ----- | ------------------------------- | ----------------------------- |
| `SRV` | `_sipfederationtls._tcp.<name>` | `sipfed.online.lync.com:5061` |

[dns-records]: https://learn.microsoft.com/en-us/microsoft-365/enterprise/external-domain-name-system-records
