# Private DNS Zone Configuration

**Zone**: `internal.contoso.com`  
**Resource Group**: `rg-dns-private`

## VNet Links
| VNet Name          | Link Name   | Auto‑registration |
|--------------------|-------------|-------------------|
| vnet-private-dns   | link-vnet1  | Enabled           |
| vnet-second        | link-vnet2  | Disabled          |

## Records
### Auto‑registered (A)
| Name                  | IP Address  | Source |
|-----------------------|-------------|--------|
| vm-test-dns           | 10.40.1.4   | VM hostname auto‑registered |

### Manual (A)
| Name | IP Address  | TTL |
|------|-------------|-----|
| db   | 10.40.3.4   | 3600 |

## Resolution Scope
- VMs in any linked VNet can resolve all records.
- Auto‑registration only creates records for VMs in VNets where it’s enabled.
- The zone is not resolvable from on‑premises unless a DNS forwarder is configured.