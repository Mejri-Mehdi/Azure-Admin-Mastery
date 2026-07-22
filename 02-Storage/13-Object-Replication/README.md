# Object Replication vs. Geo‑Redundancy

## Object Replication
- **Granularity**: Works at the container level; you choose which containers and which blobs (via prefix filters) to replicate.
- **Destinations**: Can replicate to one or more storage accounts in **any Azure region** (including same region).
- **Control**: You can replicate to a different subscription or even a different tenant.
- **Use Cases**:
  - Replicating only specific datasets to another region for compliance.
  - Distributing content for low‑latency access in multiple regions.
  - Minimizing egress costs by placing data close to compute.
- **Requirements**: Versioning must be enabled on both source and destination accounts.
- **Latency**: Asynchronous; typically under 15 minutes.

## Geo‑Redundancy (GRS / RA‑GRS / GZRS)
- **Granularity**: Replicates the entire storage account to a **paired secondary region**. You have no control over which blobs are replicated.
- **Destinations**: Only one paired region (e.g., East US → West US). Cannot be changed.
- **Failover**: In the event of a regional outage, you can initiate a customer‑managed failover to the secondary region.
- **Use Cases**:
  - Disaster recovery for the entire storage account.
  - Ensuring data durability against a regional disaster.
- **Read access**: Only RA‑GRS provides read access to the secondary; otherwise, secondary is offline until failover.
- **Cost**: Included in the SKU (GRS/RA‑GRS are more expensive than LRS).

## Comparison Table

| Feature | Object Replication | Geo‑Redundancy (GRS) |
|--------|--------------------|-----------------------|
| Scope | Specific containers/blobs | Entire storage account |
| Destination selection | Any region, multiple accounts | Only paired region |
| Versioning required | Yes | No |
| Deletion propagation | Configurable | Not propagated until failover |
| Failover support | Manual (you control DNS) | Customer‑initiated failover |
| Use case | Granular data distribution, compliance | Disaster recovery |

## Our Lab
- Configured object replication between East US (source) and West US2 (destination) for a single container.
- Demonstrated that uploaded blobs appear in the destination automatically.
- Showed that deletion behavior depends on policy settings.
- Exported the replication policy for infrastructure‑as‑code.

## Screenshots

---
![alt text](<Screenshot 2026-07-22 214149.png>)
---
![alt text](<Screenshot 2026-07-22 214612.png>)
---

## Lessons Learned
- Object Replication provides granular, controlled replication.  
- Deletion behavior must be explicitly configured.  
- Replication lag is acceptable for most DR scenarios.  