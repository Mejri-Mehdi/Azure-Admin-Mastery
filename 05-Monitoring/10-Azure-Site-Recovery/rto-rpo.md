# RTO and RPO Analysis

## Definitions
- **RPO (Recovery Point Objective)**: Maximum acceptable amount of data loss measured in time. Determines backup/replication frequency.
- **RTO (Recovery Time Objective)**: Maximum acceptable time to restore services after a disaster.

## Our ASR Configuration
- **Replication Policy**: Crash‑consistent every 5 minutes, app‑consistent every 4 hours.
- **Effective RPO**: 5 minutes for file‑system consistent recovery; up to 4 hours for application‑consistent (depending on app needs).
- **Observed RTO (Test Failover)**: Approximately 15 minutes from initiating failover to having a running VM in the secondary region.
- **Planned Failover RTO**: Usually similar or slightly longer due to final sync, but zero data loss.
- **Unplanned Failover RTO**: May be longer if the source region is under stress; RPO depends on last replication.

## Improving RTO/RPO
- Use **Premium SSD** for faster disk replication.
- Enable **accelerated networking** on source and target VMs.
- Pre‑create target network infrastructure to avoid provisioning delays.
- Consider **Azure Site Recovery plans** for multi‑VM orchestration.