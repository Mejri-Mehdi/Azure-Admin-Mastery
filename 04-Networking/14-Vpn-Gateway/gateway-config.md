# VPN Gateway Configuration & SKU Comparison

## Gateways Deployed
- **vpngw-a** (VNet A) – VpnGw1, RouteBased
- **vpngw-b** (VNet B) – VpnGw1, RouteBased
- **Connections**: `conn-a-to-b` and `conn-b-to-a`, shared key authentication, status `Connected`.

## VPN Gateway SKU Comparison
| SKU | Max S2S Tunnels | Max Throughput | BGP Support | Active-Active | Use Case |
|-----|-----------------|----------------|-------------|---------------|----------|
| Basic | 1 | 100 Mbps | No | No | Dev/Test only (legacy) |
| VpnGw1 | 10 | 650 Mbps | Yes | No | Small production |
| VpnGw2 | 10 | 1 Gbps | Yes | Yes (with 2 IPs) | Medium branch office |
| VpnGw3 | 30 | 1.25 Gbps | Yes | Yes | Large enterprise |
| VpnGw4 | 100 | 5 Gbps | Yes | Yes | High‑volume, large WAN |
| VpnGw5 | 100 | 10 Gbps | Yes | Yes | Maximum performance |

**Our choice**: VpnGw1 – cost‑effective for lab demonstration.

## Key Requirements
- Subnet named **GatewaySubnet** (exact name) with at least /27.
- Route‑based gateway required for VNet‑to‑VNet connections.
- Two connections (bidirectional) needed for VNet‑to‑VNet.