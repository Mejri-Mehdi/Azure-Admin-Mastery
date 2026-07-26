# User-Defined Routes (UDRs) and System Routes

## What are System Routes?
Azure automatically creates default routes for each subnet, such as:
- **VirtualNetwork**: route within the VNet’s address space.
- **Internet**: default route (0.0.0.0/0) to the internet via Azure’s edge.
- **LoadBalancer**: health probes and load balancer traffic.
- **VNetPeering**: routes to peered VNets (when peering is active).
- **GatewaySubnet**: routes to VPN/ExpressRoute gateways (when present).

These system routes cannot be removed, but they can be **overridden** by User-Defined Routes.

## What are UDRs?
User-Defined Routes allow you to customize the next hop for specific address prefixes. Common next hops:
- **Virtual appliance** (e.g., firewall, NVA)
- **Virtual network gateway** (VPN/ER)
- **VNet peering**
- **None** (blackhole traffic)
- **Internet**

UDRs are defined in a **Route Table**, which is associated with a subnet. All VMs in that subnet use the UDRs in addition to system routes. UDRs with matching prefixes take priority over system routes.

## Our Lab Setup
- Created `vnet-udr` with `snet-nva` (10.0.2.0/24) and `snet-workload` (10.0.1.0/24).
- Deployed an NVA VM with IP forwarding enabled (both Azure NIC and OS).
- Created a route table `rt-workload` with a default route (0.0.0.0/0) pointing to the NVA’s private IP.
- Associated the route table with `snet-workload`.
- From `vm-workload`, a traceroute to 8.8.8.8 shows the NVA as the first hop, demonstrating traffic inspection/routing through the NVA.

## When to Use UDRs
- **Force traffic through a firewall/NVA** for inspection.
- **Prevent internet access** by adding a route to `None` for `0.0.0.0/0`.
- **Route between spoke VNets** in a hub‑spoke topology using an NVA or Azure Firewall.

## Limitations
- UDRs apply to traffic **leaving** a subnet. Inbound traffic to the subnet is not affected.
- Asymmetric routing can occur if the NVA is not properly set up for stateful inspection.
- Route tables are regional; you cannot associate a route table from one region to a VNet in another.

## Screenshots

---
![alt text](<Screenshot 2026-07-26 211233.png>)
---
![alt text](<Screenshot 2026-07-26 211240.png>)
---
![alt text](<Screenshot 2026-07-26 211455.png>)
---
![alt text](<Screenshot 2026-07-26 211528.png>)
---
![alt text](<Screenshot 2026-07-26 211535.png>)
---
![alt text](<Screenshot 2026-07-26 211829.png>)
---
![alt text](<Screenshot 2026-07-26 211902.png>)
---
![alt text](<Screenshot 2026-07-26 212327.png>)
---
![alt text](<Screenshot 2026-07-26 212850.png>)
---
![alt text](<Screenshot 2026-07-26 213910.png>)
---
![alt text](<Screenshot 2026-07-26 213936.png>)
---
![alt text](<Screenshot 2026-07-26 215329.png>)
---
![alt text](<Screenshot 2026-07-26 220909.png>)
---

## Lessons Learned
- UDRs provide granular control over traffic flow.  
- NVAs require IP forwarding enabled.  
- Asymmetric routing must be avoided for stability.  