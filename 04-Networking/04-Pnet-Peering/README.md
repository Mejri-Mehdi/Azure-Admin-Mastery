# VNet Peering and Gateway Transit

## What is VNet Peering?
VNet peering connects two Azure virtual networks so that resources in each can communicate with each other using private IP addresses, over the Microsoft backbone (no internet).

## Peering Types
- **Regional peering**: Both VNets are in the same Azure region.
- **Global peering**: VNets are in different regions (slightly higher latency, costs).

## Key Peering Settings
- **Allow virtual network access**: Enables default communication between peered VNets.
- **Allow forwarded traffic**: Allows traffic forwarded by a network virtual appliance (NVA) to reach the peered VNet.
- **Allow gateway transit**: Enables the peered VNet to use a VPN/ExpressRoute gateway deployed in **this** VNet.
- **Use remote gateways**: Configures the peered VNet to use the gateway from the remote VNet.

## Non‑transitivity
Peering is **not transitive**. A ↔ B and B ↔ C does **not** imply A ↔ C. Each pair of VNets must be explicitly peered. This is a fundamental design principle; if you need a full mesh, you must configure each peering.

## Gateway Transit
In a hub‑spoke architecture, you can deploy a single VPN/ER gateway in the hub VNet and share it with spoke VNets using "Allow gateway transit" on the hub’s peering and "Use remote gateways" on the spokes’ peerings. This reduces cost and management.

## Our Lab
- Peered VNet A and VNet B; confirmed VM‑to‑VM ping.
- (Temporarily) deployed a VPN Gateway in VNet A and configured VNet B to use it.
- Added a third VNet C, peered it only with B, and proved that A cannot reach C.
- All configurations are captured, and the gateway was removed to avoid charges.

## Screenshots

---
---
---
---
---
---
---
---
---
---
---
---
---
---
---
---
---


## Lessons Learned
- Peering simplifies connectivity between VNets.  
- Gateway transit reduces cost by sharing VPN gateways.  
- Non-transitivity requires careful network design.  
