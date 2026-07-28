# Service Endpoint Configuration

## VNet: `vnet-svc` (10.60.0.0/16)
- **Subnet**: `snet-app` (10.60.1.0/24)
- **Service endpoint enabled**: `Microsoft.Storage`

## Storage Account: `storsvcxyz123`
- **Firewall**: Default action `Deny`
- **Allowed virtual networks**:
  - VNet `vnet-svc`, subnet `snet-app`
- **No public IP whitelist** (our local IP is not included)

## Test VM: `vm-svc`
- OS: Ubuntu 22.04
- Private IP: 10.60.1.x
- Public IP: (for SSH only)
- Connected to subnet `snet-app`

## Traffic Flow
- VM → Azure backbone (via service endpoint) → Storage account public endpoint
- Storage firewall identifies the traffic as coming from the allowed subnet and permits it.
- External traffic (from internet) is blocked by the firewall’s default deny rule.