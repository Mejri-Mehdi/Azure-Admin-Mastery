# Availability Zones – Zone‑Redundant vs Zonal Resources

## Zonal vs Zone‑Redundant
- **Zonal resource**: Pinned to a single availability zone (e.g., a VM in Zone 1). If that zone fails, the resource is unavailable until the zone recovers.
- **Zone‑redundant resource**: Automatically replicated or spread across multiple zones (e.g., a zone‑redundant public IP or load balancer). The resource remains available even if one zone fails.

## Our Implementation
- **VMs** are **zonal** – each lives in exactly one zone (1 or 2). This gives the highest availability when combined with multiple instances across zones.
- **Public IP** for the load balancer is **zone‑redundant** (created with `--zone 1 2 3`). Even if a zone goes offline, the IP is still accessible.
- **Load Balancer** (Standard SKU) is inherently zone‑redundant; its backend pool can contain VMs from any zone.

## Why Not Just Availability Sets?
- Availability Sets only protect within a single datacenter. If the datacenter experiences a catastrophic failure (fire, flood), all VMs in the set can be affected.
- Availability Zones provide a higher level of resilience (SLA 99.99%) by spreading VMs across physically separate facilities.
- The trade‑off is cost (inter‑zone data transfer) and the requirement to use a region that supports zones.

## Region Support
Not all Azure regions support Availability Zones. Always check the [Azure region list](https://azure.microsoft.com/global-infrastructure/geographies/). East US 2, West US 2, North Europe, and many others support zones.

## Testing the Setup
- The load balancer distributes traffic to both VMs. If you stop one VM or simulate a zone failure (not directly possible), the health probe removes it from rotation and traffic flows to the remaining VM.
- This architecture meets the 99.99% SLA when at least two VMs are deployed across zones.

## Screenshots

---
![alt text](<Screenshot 2026-07-24 123429.png>) 
---
![alt text](<Screenshot 2026-07-24 124630.png>) 
---
![alt text](<Screenshot 2026-07-24 124822.png>) 
---
![alt text](<Screenshot 2026-07-24 125858.png>) 
---
![alt text](<Screenshot 2026-07-24 125750.png>)
---

## Lessons Learned
- Availability Zones provide datacenter‑level fault isolation.  
- Zone‑redundant resources simplify high‑availability design.  
- Zonal VMs cost slightly more but offer stronger resilience. 