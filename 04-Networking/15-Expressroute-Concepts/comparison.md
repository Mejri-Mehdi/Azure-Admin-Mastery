# ExpressRoute vs. VPN Gateway

| Feature | ExpressRoute | VPN Gateway (Site‑to‑Site) |
|--------|--------------|----------------------------|
| **Connection** | Private, dedicated fiber (via partner) | Encrypted tunnel over public internet |
| **Bandwidth** | 50 Mbps – 100 Gbps | Up to 10 Gbps (depends on SKU) |
| **Latency** | Predictable, low (<5 ms within metro) | Variable, depends on internet |
| **SLA** | 99.95% (dedicated circuit) | 99.9% – 99.95% (gateway SKU dependent) |
| **Security** | No internet exposure | IPsec encryption, but traverses public internet |
| **Cost** | High (monthly circuit fee + data transfer) | Low (gateway hourly + data egress) |
| **Setup Time** | Weeks (provisioning through partner) | Minutes (portal/CLI deployment) |
| **Redundancy** | Built‑in (active‑active, multiple connections) | Active‑standby (active‑active available) |
| **Microsoft 365** | Supported via Microsoft Peering | Not recommended (traffic goes over internet) |
| **Use Case** | Enterprise hybrid cloud, compliance, high bandwidth | Small‑medium business, backup connectivity, quick setup |

## When to Choose Which
- **ExpressRoute** when you need guaranteed bandwidth, low latency, or must comply with data sovereignty rules.
- **VPN Gateway** when you need a quick, cost‑effective connection and can tolerate internet variability.
- **Combination**: Many enterprises use a VPN as a **backup** for ExpressRoute.