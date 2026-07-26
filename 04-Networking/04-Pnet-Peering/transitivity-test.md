# Peering Transitivity Test

## Topology
- VNet A ↔ VNet B (peered)
- VNet B ↔ VNet C (peered)
- VNet A ↔ VNet C: **no direct peering**

## Test
1. From vm-b (10.2.x.x), ping vm-c (10.3.x.x) → **success**
2. From vm-a (10.1.x.x), ping vm-c (10.3.x.x) → **failure** (timeout)

## Conclusion
VNet peering is **not transitive**. Even though A can talk to B and B can talk to C, A cannot talk to C unless a direct peering is established or a routing solution (like Azure Route Server or a hub‑spoke with a Network Virtual Appliance) is implemented.

This is a critical design consideration: hub‑spoke architectures require explicit peering between the hub and each spoke.