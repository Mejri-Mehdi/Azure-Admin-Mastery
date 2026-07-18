# Azure Storage Redundancy Explained

Azure Storage always stores multiple copies of your data to protect against hardware failures, disasters, and zone‑level outages. The redundancy options are:

- **LRS (Locally Redundant Storage)** – 3 copies in one datacenter. Protects against drive/rack failures.
- **ZRS (Zone‑Redundant Storage)** – 3 copies across 3 Azure availability zones in the same region. Protects against a datacenter outage.
- **GRS (Geo‑Redundant Storage)** – LRS + asynchronous replication to a secondary region (6 copies total). Secondary is not readable unless failover is initiated.
- **RA‑GRS (Read‑Access Geo‑Redundant Storage)** – GRS + read access to the secondary replica. Enables secondary reads for analytics or testing without affecting the primary.
- **GZRS (Geo‑Zone‑Redundant Storage)** – ZRS + asynchronous replication to a secondary region. Provides both zone‑level resilience and regional disaster recovery.

## Choosing the Right Redundancy
- **Minimize cost, accept single‑datacenter failure**: LRS
- **Need high availability within a region**: ZRS
- **Disaster recovery (region‑wide) without read access to secondary**: GRS
- **Disaster recovery plus read access to secondary for scaling read workloads**: RA‑GRS
- **Both zone‑level HA and disaster recovery**: GZRS

## Secondary Read Scenarios (RA‑GRS)
- Offload read‑only reporting queries to the secondary region.
- Run analytics without impacting production traffic.
- Verify data integrity in the secondary region before failover.

## Limitations Observed
- ZRS and GZRS not available in all regions (East US works).
- GRS/RA‑GRS replication is asynchronous, so the secondary may lag behind by a few minutes.
- After a customer‑initiated failover, the account becomes LRS and must be manually reconfigured back to GRS/RA‑GRS.

## SLA Reference
All redundancy options provide **99.999999999% (11 nines) durability** over a given year. Availability SLA for blob storage ranges from 99.9% (LRS/GRS) to 99.99% for RA‑GRS read requests.

## Screenshots

---
![alt text](<Screenshot 2026-07-18 142744.png>)
---
![alt text](<Screenshot 2026-07-18 142752.png>)
---
![alt text](<Screenshot 2026-07-18 154321.png>)
---
![alt text](<Screenshot 2026-07-18 154512.png>)
---
![alt text](<Screenshot 2026-07-18 160139.png>)
---

## Lessons Learned
- Redundancy choice balances cost vs durability.  
- RA-GRS provides immediate read access to secondary.  
- GZRS combines zone and geo redundancy for mission-critical workloads.  
