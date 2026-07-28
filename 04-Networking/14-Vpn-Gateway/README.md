# Azure VPN Gateway – VNet‑to‑VNet

## VPN Gateway Types
- **Site‑to‑Site (S2S)**: Connect an on‑premises network to an Azure VNet over IPsec/IKE VPN tunnel.
- **Point‑to‑Site (P2S)**: Connect individual client machines to a VNet over OpenVPN, SSTP, or IKEv2.
- **VNet‑to‑VNet**: Connect two Azure VNets using VPN gateways, similar to S2S but entirely within Azure.

## Gateway SKUs
- **Basic**: Legacy, limited throughput, no BGP. Not recommended for new deployments.
- **VpnGw1‑5**: Current generation, support BGP, active‑active, and higher throughput. Choose based on total tunnel count and required bandwidth.

## How VNet‑to‑VNet Works
1. Deploy a VPN gateway in each VNet inside the mandatory `GatewaySubnet`.
2. Create two connections (one in each direction) that reference the opposite gateway and a shared key.
3. The gateways establish an IPsec tunnel over the Azure backbone. Traffic between VNets is encrypted and routed through the gateways.
4. Unlike VNet peering, VPN gateway connections are **encrypted** and can be used when BGP or forced tunneling is required.

## When to Use VPN Gateway vs. VNet Peering
| Feature | VPN Gateway (VNet‑to‑VNet) | VNet Peering |
|--------|----------------------------|--------------|
| Encryption | IPsec (over private backbone) | Not encrypted (but still on Azure backbone) |
| Latency | Slightly higher (gateway processing) | Lower (direct routing) |
| Cost | Gateway hourly charge + bandwidth | Ingress/egress data cost |
| Bandwidth | Limited by gateway SKU | Up to 10 Gbps between VMs |
| Transitive routing | Via BGP | Non‑transitive by default |

## Our Implementation
- Built two VNets with `GatewaySubnet`s.
- Provisioned VpnGw1 gateways and established bidirectional VNet‑to‑VNet connections.
- Deployed VMs in each VNet and confirmed connectivity over the tunnel.
- Documented SKU differences and connection status.

## Sreenshots

---
![alt text](<Screenshot 2026-07-28 170624.png>)
---
![alt text](<Screenshot 2026-07-28 170632.png>)
---
![alt text](<Screenshot 2026-07-28 170727.png>)
---
![alt text](<Screenshot 2026-07-28 170736.png>)
---
![alt text](<Screenshot 2026-07-28 171459.png>)
---
![alt text](<Screenshot 2026-07-28 171503.png>)
---
![alt text](<Screenshot 2026-07-28 171839.png>)
---
![alt text](<Screenshot 2026-07-28 171909.png>)
---
![alt text](<Screenshot 2026-07-28 172200.png>)
---
![alt text](<Screenshot 2026-07-28 172405.png>)
---
![alt text](<Screenshot 2026-07-28 174442.png>)
---
![alt text](<Screenshot 2026-07-28 174512.png>)
---
![alt text](<Screenshot 2026-07-28 174640.png>)
---
![alt text](<Screenshot 2026-07-28 174653.png>)
---
![alt text](<Screenshot 2026-07-28 174707.png>)
---
![alt text](<Screenshot 2026-07-28 174733.png>)
---

## Lessons Learned
- VPN Gateway enables secure hybrid and cross-VNet connectivity.  
- SKU choice impacts throughput and features.  
- Proper subnet sizing is critical for gateway deployment.  