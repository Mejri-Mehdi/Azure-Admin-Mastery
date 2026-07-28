# 04 – Networking: VNets, Security, Load Balancing, and Connectivity

This section covers the full spectrum of Azure networking – from IP addressing and subnets to load balancers, private endpoints, VPN gateways, and troubleshooting tools. You built, secured, and tested real network topologies across 16 modules, each with detailed deliverables.

## Modules Overview

| Module | Folder | What You Built |
|--------|--------|----------------|
| **01 – VNet and Subnets** | `01-vnet-and-subnets/` | Designed a three‑tier VNet (web/app/db) with proper CIDR sizing, accounted for Azure’s 5 reserved IPs, and tested intra‑VNet connectivity. |
| **02 – NSG Rules** | `02-nsg-rules/` | Created Network Security Groups for web and database tiers with allow/deny rules by priority, validated effective security rules, and documented connectivity matrices. |
| **03 – Application Security Groups** | `03-application-security-groups/` | Replaced hard‑coded IP prefixes with ASGs to group VMs logically (web servers, app servers), simplifying NSG rule management and automatic inheritance. |
| **04 – VNet Peering** | `04-vnet-peering/` | Peered two VNets, verified connectivity, proved non‑transitivity with a third VNet, and configured gateway transit to share a VPN gateway. |
| **05 – User‑Defined Routes** | `05-user-defined-routes/` | Deployed an NVA with IP forwarding, created a route table that forces internet traffic through the NVA, and verified the path with traceroute. |
| **06 – Public IP Addresses** | `06-public-ip-addresses/` | Compared Basic vs Standard SKU public IPs (zone support, static allocation, NSG requirement), created a public IP prefix, and allocated IPs from it. |
| **07 – Azure Bastion** | `07-azure-bastion/` | Deployed Azure Bastion Standard to securely RDP/SSH to a private VM with no public IP, tested file transfer and copy‑paste via browser. |
| **08 – Azure Load Balancer** | `08-azure-load-balancer/` | Built a public Standard Load Balancer with TCP health probe, two backend IIS VMs, and verified session distribution; added an internal load balancer for private traffic. |
| **09 – Application Gateway** | `09-application-gateway/` | Deployed WAF_v2 Application Gateway with path‑based routing (`/images/*` → images pool, `/api/*` → api pool), tested normal and malicious requests in Detection mode. |
| **10 – Azure DNS Public** | `10-azure-dns-public/` | Created a public DNS zone, added A, alias, CNAME, and TXT records, and tested resolution directly against Azure’s name servers. |
| **11 – Azure DNS Private** | `11-azure-dns-private/` | Implemented private DNS zone with auto‑registration for VMs, manual records, and cross‑VNet resolution between two linked VNets. |
| **12 – Service Endpoints** | `12-service-endpoints/` | Enabled Microsoft.Storage service endpoint on a subnet, locked a storage account firewall to that subnet only, and proved that internal traffic passes while external is blocked. |
| **13 – Private Endpoints** | `13-private-endpoints/` | Created a private endpoint for Blob storage, integrated private DNS zone `privatelink.blob.core.windows.net`, disabled public access, and compared with service endpoints. |
| **14 – VPN Gateway** | `14-vpn-gateway/` | Simulated Site‑to‑Site VPN with VNet‑to‑VNet gateways (VpnGw1), established bidirectional connections, and verified cross‑VNet VM connectivity. |
| **15 – ExpressRoute Concepts** | `15-expressroute-concepts/` | Researched and documented ExpressRoute peering types, SKUs, architecture, and a comparison with VPN Gateway (conceptual only). |
| **16 – Network Watcher** | `16-network-watcher/` | Used IP Flow Verify, Next Hop, Connection Monitor, and NSG Flow Logs to diagnose connectivity between two VMs and monitor network health. |

## Key Concepts Learned

- **Network Design & Subnetting**: CIDR sizing, reserved IPs, and multi‑tier subnet separation.
- **Security**: NSG rule evaluation (priority, default rules), Application Security Groups for logical grouping, service endpoints vs. private endpoints for PaaS lockdown, forced tunneling with UDRs.
- **Load Balancing & Traffic Management**: Layer 4 (Load Balancer) vs. Layer 7 (Application Gateway) routing, health probes, path‑based rules, and WAF.
- **DNS Management**: Public and private zones, alias records, auto‑registration, cross‑VNet resolution.
- **Secure Remote Access**: Azure Bastion for agentless RDP/SSH without public IPs on VMs.
- **Hybrid Connectivity**: VPN Gateway configuration (VNet‑to‑VNet), gateway transit, ExpressRoute concepts.
- **Routing & Peering**: VNet peering (non‑transitive), gateway transit, user‑defined routes with NVAs.
- **Network Troubleshooting**: Network Watcher tools – IP flow verify, next hop, connection monitor, NSG flow logs.

## Deliverables
Each module contains configuration files, test results, diagrams, and a dedicated README. Together they form a comprehensive networking administration portfolio, directly aligned with the AZ‑104 exam objectives.