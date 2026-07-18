# Azure Storage Redundancy Comparison

| Redundancy | Replication Details | SLA (Availability) | Cost (Relative) | Secondary Read Access | Failover |
|------------|--------------------|--------------------|------------------|-----------------------|----------|
| **LRS** | 3 copies within a single datacenter | 99.9% | Lowest | No | N/A |
| **ZRS** | 3 copies across 3 availability zones in the same region | 99.9% | Low | No | N/A |
| **GRS** | LRS in primary region + 3 copies asynchronously replicated to a secondary region (unreadable) | 99.9% (primary only) | Medium | No | Customer‑initiated failover possible (converts to LRS) |
| **RA‑GRS** | GRS + read access to the secondary replica | 99.9% (primary), 99.9% (secondary reads) | Higher than GRS | Yes (read‑only) | Customer‑initiated failover possible |
| **GZRS** | ZRS in primary region + 3 copies asynchronously replicated to a secondary region (unreadable) | 99.9% (primary) | Higher | No | Customer‑initiated failover possible, but secondary not readable until failover |

**Notes:**
- All options provide 11 9's of durability (object replication).
- GZRS combines zone‑redundancy (high availability within a region) with geographic disaster recovery.
- Secondary endpoints for RA‑GRS follow the pattern `<accountname>-secondary.blob.core.windows.net`.
- Failover is manual and is typically used only during a regional outage.