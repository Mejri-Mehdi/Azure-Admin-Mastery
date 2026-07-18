# Blob Storage Tier Comparison

| Tier      | Access Latency | Minimum Storage Duration | Storage Cost (relative) | Access Cost (relative) | Typical Use Case |
|-----------|----------------|--------------------------|--------------------------|-------------------------|------------------|
| **Hot**   | Milliseconds   | None                     | Highest                  | Lowest                  | Frequently accessed data (e.g., active logs, real‑time analytics) |
| **Cool**  | Milliseconds   | 30 days                  | Lower (~50% less)        | Higher                  | Infrequent access, short‑term backup (retained 30+ days) |
| **Cold**  | Milliseconds   | 90 days                  | Lower than Cool          | Higher than Cool        | Rarely accessed, long‑term backup, archival before Archive |
| **Archive** | Hours (rehydration) | 180 days             | Lowest                   | Highest (per‑read)      | Compliance archives, cold storage where rehydration delay is acceptable |

## Notes
- **Early deletion penalty**: If a blob is moved from Cool/Cold/Archive before the minimum duration, you are charged for the remaining days.
- **Blob‑level tier** overrides the account default tier.
- **Account‑level tier** can be Hot or Cool; Archive must be set at blob level.
- Archive blobs are offline; you cannot read metadata or content until rehydrated.
- Rehydration priority can be Standard (hours) or High (for smaller files, minutes).