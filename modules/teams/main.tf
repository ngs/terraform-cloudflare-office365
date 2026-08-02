# Federation SRV record for Microsoft Teams.
#
# With Skype for Business Online retired, the sip and lyncdiscover CNAMEs and
# the _sip._tls SRV record are no longer needed by Teams-only tenants. This is
# the only record Microsoft still lists for Teams:
# https://learn.microsoft.com/en-us/microsoft-365/enterprise/external-domain-name-system-records
#
# Priority is set both at the top level and inside data. Cloudflare returns an
# SRV record's priority in both places, so setting only data.priority leaves a
# permanent diff in every plan.
resource "cloudflare_dns_record" "sipfederationtls-tcp" {
  zone_id  = var.zone_id
  name     = "_sipfederationtls._tcp.${var.name == "@" ? "" : "${var.name}."}"
  type     = "SRV"
  ttl      = 3600
  priority = 100

  data = {
    priority = 100
    weight   = 1
    port     = 5061
    target   = "sipfed.online.lync.com"
  }
}
