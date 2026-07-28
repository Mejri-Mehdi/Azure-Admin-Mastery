# Connection Monitor Results

**Monitor:** `cm-nw`  
**Source:** vm-nw1 (10.100.1.4)  
**Destination:** vm-nw2 (10.100.1.5) on TCP 3389  
**Interval:** 60 seconds

## Observations
- Average round‑trip time: ~1.2 ms  
- Packet loss: 0%  
- Failures: 0  

## Chart (screenshot or description)
Over 30 minutes, latency remained stable around 1‑2 ms, with no disconnects. This confirms RDP connectivity is healthy and continuous.

**Insight:** Connection Monitor provides ongoing, agent‑less connectivity tests, alerting if the path degrades.