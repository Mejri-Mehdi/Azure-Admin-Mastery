# Public DNS Zone Configuration

**Zone**: `myappdomain2026.xyz`  
**Resource Group**: `rg-dns-public`  
**Azure Name Servers**:
- ns1-05.azure-dns.com
- ns2-05.azure-dns.net
- ns3-05.azure-dns.org
- ns4-05.azure-dns.info

## Record Sets

| Name | Type | Value | TTL | Notes |
|------|------|-------|-----|-------|
| `www` | A | 203.0.113.10 | 300 | Points to a static public IP |
| `aliaswww` | A (alias) | pip-web resource ID | 300 | Automatically tracks IP changes |
| `blog` | CNAME | www.myappdomain2026.xyz | 3600 | Alias to `www` |
| `@` | TXT | "azure-verification=12345" | 3600 | Verification token |

## Alias Record
- `aliaswww` is an Azure DNS alias record targeting the public IP `pip-web`.  
- If the IP address changes, no DNS update is needed; Azure DNS follows the resource.