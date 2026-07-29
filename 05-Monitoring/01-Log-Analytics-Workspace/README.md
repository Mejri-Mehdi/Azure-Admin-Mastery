# Log Analytics and Azure Monitor Agent

## Architecture
Azure Monitor uses **Data Collection Rules (DCRs)** to define what telemetry to collect from virtual machines. The **Azure Monitor Agent (AMA)** reads those rules and sends data to a **Log Analytics workspace** (or other destinations). This replaces the older Microsoft Monitoring Agent (MMA/OMS).

## Key Components
- **Log Analytics workspace**: A logical container for all ingested monitoring data. You can query it with Kusto Query Language (KQL).
- **Azure Monitor Agent**: The modern, unified agent for Windows and Linux, managed via extensions.
- **Data Collection Rule (DCR)**: JSON configuration that specifies data sources (event logs, performance counters, syslog) and destinations (Log Analytics workspace).
- **Data Collection Rule Association**: Binds a DCR to a specific VM, allowing the agent to know which rules to apply.

## Pricing
- **Pay‑as‑you‑go (PerGB2018)**: Pay per GB of data ingested, first 5 GB/month free. Retention included for 30 days; extra retention costs extra.
- **Capacity Reservation**: Commit to a daily data volume for a discount (up to 15% cheaper).

## Our Lab
- Created a Log Analytics workspace with 90‑day retention.
- Deployed a Windows VM and a Linux VM.
- Installed the AMA extension on both.
- Defined DCRs for Windows (event logs + perf counters) and Linux (syslog).
- Associated the DCRs with the VMs.
- Verified heartbeat data in the workspace.

## Screenshots

---
---
---
---
---
---
---
---
---
---
---
---
---
---
---
---
---
---

## Lessons Learned
- AMA simplifies VM onboarding compared to MMA.  
- DCRs provide granular control over log collection.  
- Retention policies balance cost vs compliance 