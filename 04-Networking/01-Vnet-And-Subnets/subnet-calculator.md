# Subnet Sizing Math

## General Formulas
- **Total addresses** = 2^(32 - prefix length)
- **Usable host IPs** = Total addresses - 5 (Azure reserved)

## snet-web (10.0.1.0/24)
- Prefix: /24 → 32 - 24 = 8 bits for hosts
- Total addresses = 2^8 = 256
- Reserved = 5 (network, gateway, two DNS, broadcast)
- **Usable = 256 - 5 = 251**

## snet-app (10.0.2.0/24)
- Same math → 251 usable

## snet-db (10.0.3.0/24)
- Same math → 251 usable

## AzureBastionSubnet (10.0.4.0/26)
- Prefix: /26 → 32 - 26 = 6 bits for hosts
- Total addresses = 2^6 = 64
- Reserved = 5
- **Usable = 64 - 5 = 59**

**Why not a /27 (32 addresses)?**  
Azure requires the `AzureBastionSubnet` to be **at least /26** because Bastion needs enough IPs for scaling. A /27 would give only 27 usable (32 - 5), which is below the minimum.

## Subnet Overlap
All subnets are within the same VNet address space 10.0.0.0/16 and do not overlap. Overlapping subnets are not allowed within a single VNet.