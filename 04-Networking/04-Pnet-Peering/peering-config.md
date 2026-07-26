# VNet Peering Configuration

## VNets
- **vnet-a**: 10.1.0.0/16 (East US)
- **vnet-b**: 10.2.0.0/16 (East US)

## Peering: a-to-b
- **Status**: Connected
- **Allow virtual network access**: Enabled
- **Allow forwarded traffic**: Enabled
- **Allow gateway transit**: Enabled
- **Use remote gateways**: Disabled

## Peering: b-to-a
- **Status**: Connected
- **Allow virtual network access**: Enabled
- **Use remote gateways**: Enabled
- **Allow gateway transit**: Disabled

## VM Connectivity
- vm-a (10.1.x.x) ↔ vm-b (10.2.x.x) via private IPs – successful ping.