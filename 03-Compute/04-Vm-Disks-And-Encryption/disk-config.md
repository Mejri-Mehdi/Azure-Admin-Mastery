# Azure Disk Types and Use Cases

| Disk Type | Performance Tier | Max IOPS (per disk) | Max Throughput | Use Case | Price (relative) |
|-----------|------------------|---------------------|----------------|----------|------------------|
| **Ultra Disk** | Sub‑millisecond latency, configurable IOPS/throughput | Up to 160,000 | Up to 4,000 MB/s | Mission‑critical, high‑end databases (SAP HANA, top‑tier SQL) | Highest |
| **Premium SSD v2** | Sub‑millisecond, scalable independently | Up to 80,000 | Up to 1,200 MB/s | Production workloads that need to scale performance without moving to a bigger disk | Lower than Ultra, higher than Premium SSD |
| **Premium SSD** | Low latency, provisioned IOPS | Up to 20,000 | Up to 900 MB/s | Production VMs, medium traffic databases | Medium |
| **Standard SSD** | Consistent performance, lower than Premium | Up to 6,000 | Up to 750 MB/s | Dev/Test, low‑traffic web servers, light workloads | Low |
| **Standard HDD** | Magnetic, higher latency | Up to 2,000 | Up to 500 MB/s | Backup, archival, infrequent access | Lowest |

## Choosing the Right Disk
- **Ultra Disk**: When you need guaranteed sub‑millisecond latency and control over IOPS/throughput independently.
- **Premium SSD v2**: For most production workloads that require high throughput but don’t need Ultra’s extreme performance.
- **Premium SSD**: General production; consistent IOPS and low latency.
- **Standard SSD**: Cost‑effective for development and test, still provides SSD performance.
- **Standard HDD**: Cheap, reliable for bulk storage or backups.

All disks in this lab use **managed disks**, which abstract away the underlying storage accounts and provide 99.999% durability.