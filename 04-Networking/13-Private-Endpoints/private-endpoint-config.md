# Private Endpoint Configuration

## VNet: `vnet-pe` (10.70.0.0/16)
- **Subnet**: `snet-private` (10.70.1.0/24)
- **Private endpoint network policies**: Disabled

## Private Endpoint: `pe-stg-blob`
- **Target resource**: `stgpexyz123` (Blob service)
- **Private IP**: 10.70.1.x (automatically assigned)
- **Private DNS zone**: `privatelink.blob.core.windows.net`
- **DNS zone group**: `zone-group-blob` (auto‑registers A record)

## Storage Account: `stgpexyz123`
- **Public network access**: Disabled (default action `Deny`)
- **No firewall IP rules** (only accessible via private endpoint)

## Test VM: `vm-pe`
- OS: Ubuntu 22.04
- Private IP: 10.70.1.y
- Connected to same subnet, can resolve storage FQDN to private IP.