# VM Insights

## What is VM Insights?
VM Insights provides in‑depth monitoring of Azure VMs, including performance analysis and automatic process/connection mapping. It goes beyond basic host metrics by showing how processes communicate, open ports, and dependencies.

## VM Insights vs. Basic Metrics
| Feature | Basic Metrics (Platform) | VM Insights |
|---------|--------------------------|-------------|
| **Data** | CPU, disk, network (host) | Same metrics + process‑level data, open ports, connection maps |
| **Visualization** | Individual metric charts | Integrated Map and Performance views |
| **Dependencies** | Not available | Yes – via Dependency Agent |
| **Troubleshooting** | Manual correlation | Quick identification of process bottlenecks |
| **Requirements** | None (built‑in) | Azure Monitor Agent + Dependency Agent |

## How We Configured It
- Enabled VM Insights from the Azure Portal on two VMs (Windows + Linux).
- The portal installed the required agents and created a Data Collection Rule for VM Insights.
- Verified the Map (processes, connections, ports) and Performance charts (CPU, memory, disk, network).
- Created a custom workbook “VM Performance Summary” with CPU trends and top‑10 CPU consumers.

## When to Use VM Insights
- You need to troubleshoot connectivity issues between VMs (e.g., is the app server reaching the database?).
- You want a centralised performance dashboard for all VMs.
- You’re performing capacity planning and need historical performance data with dependency maps.

## Screenshots

---
![alt text](<Screenshot 2026-07-30 181834.png>)
---
![alt text](<Screenshot 2026-07-30 181843.png>)
---
![alt text](<Screenshot 2026-07-30 182014.png>)
---
![alt text](<Screenshot 2026-07-30 182029.png>)
---
![alt text](<Screenshot 2026-07-30 190041.png>)
---
![alt text](<Screenshot 2026-07-30 190100.png>)
---
![alt text](<Screenshot 2026-07-30 190104.png>)
---
![alt text](<Screenshot 2026-07-30 190212.png>)
---
![alt text](<Screenshot 2026-07-30 190234.png>)
---
![alt text](<Screenshot 2026-07-30 190246.png>)
---
![alt text](<Screenshot 2026-07-30 190250.png>)
---
![alt text](<Screenshot 2026-07-30 190446.png>)
---
![alt text](<Screenshot 2026-07-30 190449.png>)
---
![alt text](<Screenshot 2026-07-30 190623.png>)
---
![alt text](<Screenshot 2026-07-30 190828.png>)
---
![alt text](<Screenshot 2026-07-30 190915.png>)
---
![alt text](<Screenshot 2026-07-30 191116.png>)
---
![alt text](<Screenshot 2026-07-30 191150.png>)
---

## Lessons Learned
- VM Insights provides richer monitoring than basic metrics.  
- Dependency maps help identify bottlenecks and network issues.  
- Workbooks enable customizable, shareable monitoring dashboards.  