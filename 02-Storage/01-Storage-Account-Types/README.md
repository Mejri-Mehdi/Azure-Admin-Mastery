# Azure Storage Account Types

## When to Use Which Account

- **Standard general‑purpose v2 (StorageV2)**:  
  Use for most scenarios: blob storage, file shares, queues, tables. It supports all redundancy options (LRS, GRS, RA‑GRS, ZRS) and offers tiered access (Hot, Cool, Cold, Archive). Best for cost‑effective, balanced performance.

- **Premium Block Blobs (BlockBlobStorage)**:  
  Use for high‑throughput, low‑latency block blob workloads such as data analytics, machine learning, and cloud‑native applications that require sub‑millisecond consistency. Not for file shares, queues, or tables.

- **Premium File Shares (FileStorage)**:  
  Use for high‑performance file shares that need SSD storage (e.g., SQL Server on Azure VMs, lift‑and‑shift applications). Supports SMB and NFS protocols, and provides low latency and high IOPS.

- **Premium Page Blobs (not created here)**:  
  Historically used for unmanaged disks (now mostly replaced by Managed Disks). Page blobs can also be created in a general‑purpose v2 (LRS/ZRS) but are not premium.

- **BlobStorage (legacy)**:  
  Being replaced by StorageV2. It only supported block blobs and append blobs, with no file/queue/table. New deployments should use StorageV2.

## Replication Choices
- **LRS** (Locally redundant): 3 copies in one data center. Lowest cost.
- **GRS** (Geo‑redundant): LRS + async copy to secondary region. Disaster recovery.
- **ZRS** (Zone‑redundant): 3 copies across availability zones. High availability within region.

## Secure Transfer
All new storage accounts have **Secure transfer required** enabled by default, meaning they only accept HTTPS requests. This is a security best practice.

## Our Lab
We created four accounts to demonstrate:
- The flexibility of Standard v2 for all services.
- The specialisation of Premium Block Blobs and FileStorage.
- How the account kind restricts available features.
- The impact of replication (LRS vs GRS) on capabilities (e.g., page blobs need LRS).

## Screenshots

---
![alt text](<Screenshot 2026-07-18 130342.png>)
---
![alt text](<Screenshot 2026-07-18 130419.png>)
---

## Lessons Learned
- Choosing the right account type depends on workload (analytics vs databases vs general purpose).  
- Premium accounts deliver higher performance but at higher cost.  
- Policies and governance should enforce secure transfer and tagging.  