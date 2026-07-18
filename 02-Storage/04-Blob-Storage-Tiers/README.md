# Azure Blob Storage Access Tiers

## Overview
Azure Blob Storage offers four access tiers to optimize cost vs. access frequency:

- **Hot** – For data accessed frequently. Highest storage cost, lowest access cost.
- **Cool** – For data accessed infrequently (at least every 30 days). Lower storage cost, higher access cost.
- **Cold** – For data accessed rarely (at least every 90 days). Even lower storage cost, higher access cost than Cool.
- **Archive** – For data that can be stored offline for months/years. Lowest storage cost, highest retrieval cost, hours of rehydration latency.

## When to Use Each Tier
- **Hot**: real‑time telemetry, active user databases, front‑end media.
- **Cool**: backups kept for 30+ days, disaster recovery data, short‑term logs.
- **Cold**: long‑term backups, compliance data accessed quarterly.
- **Archive**: regulatory archives, raw data that may never be read again.

## Blob‑Level vs Account‑Level Tier
- **Account‑level**: sets the default tier for blobs that don’t have an explicit tier. Can be Hot or Cool.
- **Blob‑level**: overrides the account default for a specific blob; can be Hot, Cool, Cold, or Archive.

## Lifecycle Management
Azure Storage lifecycle management policies can automatically move blobs between tiers based on rules (e.g., "move to Cool after 30 days, Archive after 180 days").

## Demo Learnings
- Setting a blob to Archive immediately makes it unreadable.
- Rehydration from Archive to Hot is a background process; until complete, the blob cannot be read.
- There is a minimum storage duration for each non‑Hot tier, and early deletion penalties apply.
- Blob tiers directly impact your monthly storage bill, so right‑tiering is a powerful cost‑optimization lever.

## Screenshots

---
![alt text](<Screenshot 2026-07-18 173406.png>)
---
![alt text](<Screenshot 2026-07-18 173519.png>)
---
![alt text](<Screenshot 2026-07-18 173543.png>)
---
![alt text](<Screenshot 2026-07-18 173730.png>)
---
![alt text](<Screenshot 2026-07-18 193044.png>)
---

## Lessons Learned
- Blob tiers optimize cost vs performance trade-offs.  
- Archive tier requires planning due to rehydration delays.  
- Account-level defaults simplify management, blob-level overrides provide flexibility.  