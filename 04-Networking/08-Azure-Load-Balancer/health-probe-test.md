# Health Probe Failover Test

## Setup
- **Public Load Balancer**: `lb-public` (frontend IP `<public‑ip>`)
- **Backend pool**: `vm-lb1` (10.20.1.4), `vm-lb2` (10.20.1.5)
- **Health probe**: TCP port 80, 5‑sec interval, 2 consecutive failures

## Test Steps
1. Before stopping IIS, both VMs respond: browser refresh alternates between “Hello from vm‑lb1” and “Hello from vm‑lb2”.
2. Stopped IIS on `vm-lb1` via Portal Run Command: `Stop-Service W3SVC`.
3. Within ~10 seconds (2 probe failures × 5 sec interval + processing), the load balancer marks `vm-lb1` as **unhealthy**.
4. All subsequent web requests return only “Hello from vm‑lb2”.
5. Started IIS again on `vm-lb1`: `Start-Service W3SVC`.
6. After a few seconds, the health probe succeeds and traffic resumes to both VMs.

## Conclusion
The health probe effectively detects application‑level failures and removes the unhealthy instance from rotation. This ensures high availability without manual intervention.