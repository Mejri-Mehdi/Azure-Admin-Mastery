# Recovery Services Vault – Backup and Disaster Recovery

## What is a Recovery Services Vault?
A Recovery Services vault is a storage entity in Azure that houses backup data for virtual machines, SQL databases, and other workloads. It also supports Site Recovery for disaster recovery orchestration.

## Backup Policies
A backup policy defines **when** backups are taken (schedule) and **how long** they are kept (retention).

- **Daily retention**: Short‑term operational recovery (e.g., 30 days).
- **Weekly retention**: Weekend snapshots retained for several weeks.
- **Monthly retention**: Long‑term archival points for compliance.

## Soft Delete
- Protects backup data from accidental deletion or ransomware.
- Deleted backups are kept in a soft‑deleted state for 14 days (configurable).
- During this period, you can recover the backup data without data loss.

## Cross‑Region Restore
- Available only with GRS vaults.
- Allows restoring backups from the secondary Azure region in case of a primary region outage.
- Provides an additional layer of business continuity.

## Our Configuration
- Created a GRS vault `rsv-backup` in East US.
- Enabled soft delete (default 14 days) and cross‑region restore.
- Defined a daily backup policy with 30‑day daily, 12‑week weekly, and 12‑month monthly retention.
- Protected two VMs (`vm-win-bk`, `vm-linux-bk`) and initiated an on‑demand backup.

## Monitoring
- Backup jobs can be viewed via `az backup job list` or in the portal under Recovery Services vault → **Backup Jobs**.
- Alerts can be configured for backup failures.

## Screenshots

---
![alt text](<Screenshot 2026-07-31 190503.png>)
---
![alt text](<Screenshot 2026-07-31 190526.png>)
---
![alt text](<Screenshot 2026-07-31 190538.png>)
---
![alt text](<Screenshot 2026-07-31 190550.png>)
---
![alt text](<Screenshot 2026-07-31 190807.png>)
---
![alt text](<Screenshot 2026-07-31 190848.png>)
---
![alt text](<Screenshot 2026-07-31 191017.png>)
---
![alt text](<Screenshot 2026-07-31 191352.png>)
---
![alt text](<Screenshot 2026-07-31 191410.png>)
---
![alt text](<Screenshot 2026-07-31 191529.png>)
---
![alt text](<Screenshot 2026-07-31 191540.png>)
---
![alt text](<Screenshot 2026-07-31 191609.png>)
---
![alt text](<Screenshot 2026-07-31 191838.png>)
---
![alt text](<Screenshot 2026-07-31 191903.png>)
---
![alt text](<Screenshot 2026-07-31 192712.png>)
---
![alt text](<Screenshot 2026-07-31 192737.png>)
---
![alt text](<Screenshot 2026-07-31 192815.png>)
---
![alt text](<Screenshot 2026-07-31 192857.png>)
---
![alt text](<Screenshot 2026-07-31 193035.png>)
---
![alt text](<Screenshot 2026-07-31 193051.png>)
---
![alt text](<Screenshot 2026-07-31 193931.png>)
---
![alt text](<Screenshot 2026-07-31 193952.png>)
---
![alt text](<Screenshot 2026-07-31 193957.png>)
---

## Lessons Learned
- Recovery Services Vault centralizes backup management.  
- Policies enforce compliance and retention requirements.  
- Soft delete adds resilience against ransomware.  
- Cross-region restore improves disaster recovery readiness. 