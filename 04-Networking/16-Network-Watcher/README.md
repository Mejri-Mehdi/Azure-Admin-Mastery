# Network Watcher – Troubleshooting Tools

## Tool Overview
Azure Network Watcher provides a suite of tools to monitor, diagnose, and gain insights into network performance and health.

### IP Flow Verify
- Tells you whether a specific flow (5‑tuple) is allowed or denied by your NSGs.
- Quick way to pinpoint misconfigured rules.

### Next Hop
- Determines the next hop for a packet from a VM.  
- Useful for diagnosing routing issues (e.g., is traffic going to the internet, a virtual appliance, or dropping?).

### Connection Monitor
- Continuous monitoring of connectivity between resources.  
- Provides end‑to‑end latency, hop‑by‑hop topology, and detects failures.

### NSG Flow Logs
- Logs all allowed and denied traffic through an NSG.  
- Data sent to Azure Storage or Log Analytics for analysis.  
- Ideal for security auditing and traffic pattern analysis.

### Packet Capture
- Captures network traffic to and from a VM (similar to Wireshark).  
- Useful for deep packet inspection when other tools don’t give enough detail.

## Our Lab
- Deployed two VMs with a mix of allow and deny NSG rules.
- Used IP Flow Verify to confirm which flows were permitted/blocked.
- Used Next Hop to validate routing to the internet and within the VNet.
- Set up Connection Monitor to track RDP latency over time.
- Enabled NSG Flow Logs to capture all traffic patterns.

## When to Use Each Tool
| Symptom | Tool |
|---------|------|
| Can’t connect to a VM on a specific port | IP Flow Verify |
| Traffic not reaching the internet | Next Hop |
| Intermittent connectivity issues | Connection Monitor |
| Need to audit network traffic | NSG Flow Logs |
| Need to inspect packets for debugging | Packet Capture |

## Screenshots 

---
![alt text](<Screenshot 2026-07-28 184404.png>)
---
![alt text](<Screenshot 2026-07-28 184415.png>)
---
![alt text](<Screenshot 2026-07-28 184815.png>)
---
![alt text](<Screenshot 2026-07-28 184913.png>)
---
![alt text](<Screenshot 2026-07-28 184921.png>)
---
![alt text](<Screenshot 2026-07-28 185135.png>)
---
![alt text](<Screenshot 2026-07-28 185857.png>)
---
![alt text](<Screenshot 2026-07-28 190022.png>)
---
![alt text](<Screenshot 2026-07-28 190702.png>)
---
![alt text](<Screenshot 2026-07-28 190823.png>)
---
![alt text](<Screenshot 2026-07-28 191431.png>)
---
![alt text](<Screenshot 2026-07-28 191519.png>)
---
![alt text](<Screenshot 2026-07-28 192100.png>)
---
![alt text](<Screenshot 2026-07-28 192136.png>)
---
![alt text](<Screenshot 2026-07-28 192216.png>)
---
![alt text](<Screenshot 2026-07-28 192226.png>)
---
![alt text](<Screenshot 2026-07-28 192454.png>)
---
![alt text](<Screenshot 2026-07-28 192904.png>)
---
![alt text](<Screenshot 2026-07-28 195300.png>)
---
![alt text](<Screenshot 2026-07-28 195410.png>)
---
![alt text](<Screenshot 2026-07-28 195523.png>)
---
![alt text](<Screenshot 2026-07-28 195628.png>)
---
![alt text](<Screenshot 2026-07-28 195740.png>)
---
![alt text](<Screenshot 2026-07-28 195812.png>)
---
![alt text](<Screenshot 2026-07-28 195950.png>)
---
![alt text](<Screenshot 2026-07-28 200030.png>)
---
![alt text](<Screenshot 2026-07-28 200055.png>)
---
![alt text](<Screenshot 2026-07-28 200127.png>)
---
![alt text](<Screenshot 2026-07-28 200153.png>)
---
![alt text](<Screenshot 2026-07-28 200532.png>)
---
![alt text](<Screenshot 2026-07-28 201111.png>)
---
![alt text](<Screenshot 2026-07-28 201134.png>)
---
![alt text](<Screenshot 2026-07-28 201258.png>)
---
![alt text](<Screenshot 2026-07-28 201309.png>)
---
![alt text](<Screenshot 2026-07-28 201529.png>)
---
![alt text](<Screenshot 2026-07-28 201643.png>)
---
![alt text](<Screenshot 2026-07-28 201822.png>)
---
![alt text](<Screenshot 2026-07-28 201833.png>)
---
![alt text](<Screenshot 2026-07-28 202012.png>)
---

## Lessons Learned
- Network Watcher provides visibility into NSG rules and routing.  
- Connection Monitor helps track latency trends.  
- Flow logs enable traffic pattern analysis.  
- Packet capture is useful for advanced troubleshooting. 