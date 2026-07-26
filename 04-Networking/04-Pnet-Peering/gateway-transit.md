# Gateway Transit Configuration

## Scenario
A VPN Gateway is deployed in VNet A to connect to on‑premises networks. VNet B needs to reach the same on‑premises resources without deploying its own gateway.

## Gateway Setup (temporary)
- **Gateway subnet**: 10.1.255.0/27
- **VPN Gateway**: vnet-a-gw (SKU VpnGw1, RouteBased)
- **Peering b-to-a**: Uses remote gateways (`--use-remote-gateways`)

## How it works
1. The gateway in VNet A learns routes (via BGP or static) and propagates them to VNet A.
2. Because VNet B uses remote gateways, those routes are also injected into VNet B's route table.
3. VMs in VNet B can now send traffic to on‑premises via the gateway in VNet A.

## Cleanup
Gateway was deleted immediately after documentation to avoid cost.