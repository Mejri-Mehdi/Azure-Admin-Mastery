# SLA Comparison: Availability Sets vs Availability Zones

| Feature | Availability Set | Availability Zones |
|--------|------------------|---------------------|
| **Protection scope** | Single datacenter (racks) | Multiple datacenters within a region |
| **Fault isolation** | Physical rack/power | Entire datacenter (zone) |
| **SLA for VMs** | 99.95% (2+ VMs) | 99.99% (2+ VMs in 2+ zones) |
| **Update behavior** | Sequential update domains (no downtime for all) | Zones are updated independently; you control sequencing |
| **Cost** | No additional cost beyond VM | VM compute same; cross‑zone data transfer incurs cost |
| **Architecture** | VMs in same VNet, same datacenter | VMs in same region but different physical locations |
| **Use case** | High availability within a datacenter | Regional resilience, disaster avoidance |

## Detailed SLA Explanation
- **Availability Set**: Microsoft guarantees at least 99.95% connectivity when two or more instances are deployed in the same availability set. This accounts for failures that affect a single rack or update domain.
- **Availability Zones**: 99.99% when two or more VMs are distributed across two or more zones. This protects against a full datacenter outage (e.g., fire, power loss) because each zone has independent power, cooling, and networking.

## Cost Considerations
- VM compute pricing is identical regardless of zone placement.
- **Data transfer between zones** is billed at inter‑zone rates (~$0.01/GB in most regions). This can add up for high‑bandwidth applications.
- Zone‑redundant services (like the public IP and load balancer) have no extra cost beyond the Standard SKU.