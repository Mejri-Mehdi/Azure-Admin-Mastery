# RTO and RPO Analysis

| Workload | Component | RPO | RTO | Notes |
|----------|-----------|-----|-----|-------|
| Virtual Machine | ASR | 5 minutes (crash‑consistent) | ~15 minutes (test failover observed) | App‑consistent recovery point every 4 hours if needed. |
| Storage Account | GRS | <15 minutes (typical) | Customer‑initiated failover takes ~15 minutes | Asynchronous replication; some data loss possible in unplanned failover. |
| SQL Database | Geo‑replication | <5 seconds (synchronous for active geo‑replication? Actually, Azure SQL active geo‑replication is asynchronous, RPO <5s typically, but can be up to 30s) | Failover time <30 seconds | Active geo‑replication supports up to 4 secondaries. |

## Aggregated RTO/RPO for the solution
- **Best‑case RPO**: 5 seconds (SQL) to 5 minutes (VM).
- **Best‑case RTO**: Under 30 minutes for full application recovery, assuming DNS changes and application validation.

## Test Failover Observations
- Test failover of VM took 18 minutes from initiation to a running VM in West US2.
- No impact on the source VM.
- The test VM was identical to the source at the selected recovery point.