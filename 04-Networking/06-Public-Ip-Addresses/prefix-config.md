# Public IP Prefix Configuration

## Created Prefix
- **Name**: `pip-prefix`
- **Region**: East US
- **Prefix length**: /31 (2 IP addresses)
- **Reserved IP range**: (shown in portal or via `az network public-ip prefix show`)

## Why Use a Prefix?
- **Static IP whitelisting**: Allocate IPs from a known, contiguous block so that external firewalls can whitelist the entire range.
- **Simplified management**: Assign IPs to multiple resources without worrying about individual IP changes.
- **Cost**: No additional charge for the prefix itself; you pay only for the individual IPs you allocate from it.

## Create IP from Prefix
```powershell
az network public-ip create `
  --name pip-from-prefix `
  --resource-group rg-publicip `
  --sku Standard `
  --allocation-method Static `
  --public-ip-prefix <prefix-resource-id>
```
This IP is now part of the reserved block.

## Limitations

- Prefix length must be at least /31 (2 IPs). Larger prefixes provide more IPs.
- Only Standard SKU public IPs can be created from a prefix.
- The prefix and the IPs must reside in the same region.