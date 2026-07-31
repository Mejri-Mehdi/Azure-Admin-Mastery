# Azure Site Recovery – Disaster Recovery

## What is ASR?
Azure Site Recovery replicates workloads from a primary site (on‑premises or Azure) to a secondary Azure region. It orchestrates failover and failback, ensuring business continuity during outages.

## ASR Components
- **Vault**: Holds replication policies and failover settings (separate from backup vault, though both are Recovery Services vaults).
- **Replication Policy**: Defines recovery point frequency and retention.
- **Replicated Items**: Each protected VM or server.
- **Failover Types**:
  - **Test Failover**: Validates DR readiness without disrupting production.
  - **Planned Failover**: Graceful migration with zero data loss (shuts down source).
  - **Unplanned Failover**: Initiates when the primary site is unavailable; may have data loss.
- **Failback**: After the primary site recovers, reverse replication and failback to return to normal operations.

## Our Implementation
- Created a Recovery Services vault in West US2.
- Enabled replication for an East US VM with a 5‑minute crash‑consistent policy.
- Performed a successful test failover into an isolated VNet.
- Documented RTO (15 min) and RPO (5 min) based on the observed behavior.
- Cleaned up test resources without affecting the active replication.

## When to Use ASR
- Protecting mission‑critical applications against regional outages.
- Meeting compliance requirements for DR testing.
- Migrating workloads between regions (lift‑and‑shift).

## Cost Considerations
- You pay for the ASR service (per instance) plus storage costs for replicated data in the target region.
- Test failover VMs incur compute charges while running; clean them up promptly.

## Screenshots

---
![alt text](<Screenshot 2026-07-31 221648.png>)
---
![alt text](<Screenshot 2026-07-31 221715.png>)
---
![alt text](<Screenshot 2026-07-31 223533.png>)
---
![alt text](<Screenshot 2026-07-31 224025.png>)
---
![alt text](<Screenshot 2026-07-31 224033.png>)
---
![alt text](<Screenshot 2026-07-31 224123.png>)
---
![alt text](<Screenshot 2026-07-31 224203.png>)
---
![alt text](<Screenshot 2026-07-31 224623.png>)
---
![alt text](<Screenshot 2026-07-31 231759.png>)
---
![alt text](<Screenshot 2026-07-31 234653.png>)
---
![alt text](<Screenshot 2026-07-31 235913.png>)
---
![alt text](<Screenshot 2026-08-01 000006.png>)
---
![alt text](<Screenshot 2026-08-01 000035.png>)
---
![alt text](<Screenshot 2026-08-01 000038.png>)
---
![alt text](<Screenshot 2026-08-01 000056.png>)
---
![alt text](<Screenshot 2026-08-01 002839.png>)
---
![alt text](<Screenshot 2026-08-01 002901.png>)
---
![alt text](<Screenshot 2026-08-01 002921.png>)
---
![alt text](<Screenshot 2026-08-01 002945.png>)
---
![alt text](<Screenshot 2026-08-01 003026.png>)
---
![alt text](<Screenshot 2026-08-01 003312.png>)
---
![alt text](<Screenshot 2026-08-01 003324.png>)
---
![alt text](<Screenshot 2026-08-01 003332.png>)
---
![alt text](<Screenshot 2026-08-01 003336.png>)
---

## Lessons Learned
- ASR provides enterprise-grade disaster recovery.  
- Test failover validates readiness without downtime.  
- RTO/RPO objectives guide DR planning.  