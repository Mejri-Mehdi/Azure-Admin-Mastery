# Backup Policy Comparison

| Policy Name            | Frequency      | Retention                                   | Use Case |
|------------------------|----------------|---------------------------------------------|----------|
| Daily-30Days           | Daily at 03:00 UTC | 30 days (daily)                              | General‑purpose VM backup; short‑term recovery. |
| Daily-Weekly-Monthly   | Daily at 03:00 UTC | 30 days (daily), 12 weeks (weekly), 12 months (monthly) | Compliance and long‑term archival (GFS). |
| Hourly-Critical        | Every 4 hours   | 7 days                                      | Mission‑critical VMs with low RPO requirements. |

## GFS (Grandfather‑Father‑Son) Explained
- **Son**: Daily backups retained for 30 days.
- **Father**: Weekly backups (every Sunday) retained for 12 weeks.
- **Grandfather**: Monthly backups (first Sunday) retained for 12 months.

This pattern ensures multiple recovery points across different timeframes, balancing storage cost and recovery flexibility.