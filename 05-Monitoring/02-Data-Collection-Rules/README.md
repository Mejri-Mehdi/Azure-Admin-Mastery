# Data Collection Rules (DCR) – Benefits and Architecture

## What are Data Collection Rules?
A Data Collection Rule (DCR) is a JSON configuration document that defines what data to collect from virtual machines, how to transform it, and where to send it. It is the cornerstone of the modern Azure Monitor agent-based data collection.

## Why DCRs are superior to legacy agent configuration
- **Centralized management**: One DCR can be applied to hundreds of VMs, eliminating per-VM configuration.
- **Granular control**: Collect only the performance counters, event logs, or syslog facilities you need.
- **Multi-destination**: A single DCR can send data to multiple Log Analytics workspaces, storage accounts, or Event Hubs simultaneously.
- **Versioning and audit**: DCRs are ARM resources, meaning they support change history, RBAC, and policies.
- **Layered collections**: Multiple DCRs can be associated with the same VM; the agent merges them, so you can have separate rules for security, performance, and application logs.

## Our Implementation
- Created a DCR for Windows (`dcr-win-enhanced`) that collects CPU performance and System event log errors/warnings.
- Created a DCR for Linux (`dcr-linux-perf`) that collects CPU performance counters.
- Associated both DCRs with their respective VMs alongside the previously created base DCRs.
- Verified data using KQL queries against the Log Analytics workspace.

## Key Concepts
- **Association**: A link between a DCR and a VM (or VMSS). The Azure Monitor Agent reads all associated DCRs.
- **Streams**: Logical groupings of data types (e.g., `Microsoft-Perf`, `Microsoft-WindowsEvent`, `Microsoft-Syslog`).
- **Destinations**: Where the data should be sent – typically a Log Analytics workspace.


## Screenshots

---
![alt text](<Screenshot 2026-07-29 171748.png>)
---
![alt text](<Screenshot 2026-07-29 171919.png>)
---
![alt text](<Screenshot 2026-07-29 171958.png>)
---
![alt text](<Screenshot 2026-07-29 172945.png>)
---
![alt text](<Screenshot 2026-07-29 173000.png>)
---
![alt text](<Screenshot 2026-07-29 173018.png>)
---
![alt text](<Screenshot 2026-07-29 173131.png>)
---
![alt text](<Screenshot 2026-07-29 173226.png>)
---
![alt text](<Screenshot 2026-07-29 173559.png>)
---
![alt text](<Screenshot 2026-07-29 173811.png>)
---
![alt text](<Screenshot 2026-07-29 173816.png>)
---
![alt text](<Screenshot 2026-07-29 173906.png>)
---
![alt text](<Screenshot 2026-07-29 173913.png>)
---
![alt text](<Screenshot 2026-07-29 173926.png>)
---

## Lessons Learned
- DCRs simplify multi‑VM monitoring.  
- AMA + DCR replaces legacy MMA agent.  
- Queries validate ingestion and provide 

