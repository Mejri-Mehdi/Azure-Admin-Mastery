# Recovery Services Vault Configuration

**Vault**: `rsv-backup`  
**Resource Group**: `rg-backup`  
**Region**: East US  
**Storage Replication**: Geo‑Redundant (GRS)  
**Soft Delete**: Enabled (14‑day retention)  
**Cross‑Region Restore**: Enabled (allows restore from secondary region)

## Backup Policy: `DailyBackupPolicy`
- **Frequency**: Daily at 02:00 UTC
- **Daily Retention**: 30 days
- **Weekly Retention**: 12 weeks (retains every Sunday)
- **Monthly Retention**: 12 months (retains first Sunday of each month)

## Protected VMs
| VM Name | Status | Last Backup |
|---------|--------|-------------|
| vm-win-bk | Protected | (triggered on‑demand) |
| vm-linux-bk | Protected | Pending schedule |

## Key Features
- **Soft Delete**: Deleted backups are retained for 14 days, protecting against accidental or malicious deletion.
- **Cross‑Region Restore**: In a regional outage, you can restore backups from the paired secondary region (e.g., West US for East US).