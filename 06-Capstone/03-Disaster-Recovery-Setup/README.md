# Disaster Recovery Strategy – Multi‑Region Resilience

## Architecture
This DR solution protects a three‑tier application across two Azure regions:

- **Primary**: East US – active workloads.
- **Secondary**: West US2 – standby replicas.

## Protection Mechanisms
| Resource | Method | Failover |
|----------|--------|----------|
| Virtual Machine | Azure Site Recovery (ASR) | Manual or automated recovery plan |
| Storage Account | GRS (geo‑redundant storage) | Customer‑managed failover |
| SQL Database | Active geo‑replication | Manual or forced failover |

## Failover Runbook
A detailed runbook (`dr-runbook.md`) covers planned and unplanned failover, including step‑by‑step commands for SQL, storage, and VMs, plus failback procedures.

## RTO/RPO
- **RPO**: 5 seconds (SQL) to 5 minutes (VM)
- **RTO**: 15–30 minutes for full recovery

These numbers are based on the test failover (`test-results.md`) and the replication policies configured.

## Regular Testing
- Perform a non‑disruptive test failover quarterly.
- Validate application functionality after failover.
- Keep the runbook up to date with any architecture changes.

## Cost Considerations
- ASR charges per protected instance.
- GRS storage costs more than LRS.
- SQL geo‑replication adds extra compute cost.
All are justified by the need for business continuity.

## Screenshots

---
![alt text](<Screenshot 2026-08-02 103124.png>)
---
![alt text](<Screenshot 2026-08-02 103151.png>)
---
![alt text](<Screenshot 2026-08-02 103302.png>)
---
![alt text](<Screenshot 2026-08-02 103311.png>)
---
![alt text](<Screenshot 2026-08-02 103348.png>)
---
![alt text](<Screenshot 2026-08-02 103356.png>)
---
![alt text](<Screenshot 2026-08-02 103645.png>)
---
![alt text](<Screenshot 2026-08-02 103653.png>)
---
![alt text](<Screenshot 2026-08-02 103819.png>)
---
![alt text](<Screenshot 2026-08-02 103836.png>)
---
![alt text](<Screenshot 2026-08-02 104049.png>)
---
![alt text](<Screenshot 2026-08-02 104136.png>)
---
![alt text](<Screenshot 2026-08-02 104231.png>)
---
![alt text](<Screenshot 2026-08-02 104308.png>)
---
![alt text](<Screenshot 2026-08-02 105403.png>)
---
![alt text](<Screenshot 2026-08-02 105455.png>)
---
![alt text](<Screenshot 2026-08-02 105500.png>)
---
![alt text](<Screenshot 2026-08-02 105606.png>)
---
![alt text](<Screenshot 2026-08-02 105635.png>)
---
![alt text](<Screenshot 2026-08-02 105644.png>)
---
![alt text](<Screenshot 2026-08-02 105658.png>)
---
![alt text](<Screenshot 2026-08-02 105751.png>)
---
![alt text](<Screenshot 2026-08-02 105758.png>)
---
![alt text](<Screenshot 2026-08-02 105945.png>)
---
![alt text](<Screenshot 2026-08-02 105956.png>)
---
![alt text](<Screenshot 2026-08-02 110103.png>)
---
![alt text](<Screenshot 2026-08-02 110114.png>)
---
![alt text](<Screenshot 2026-08-02 110121.png>)
---
![alt text](<Screenshot 2026-08-02 110128.png>)
---

## Lessons Learned
- DR requires replication across compute, storage, and database layers.  
- Test failover ensures readiness without downtime.  
- RTO/RPO objectives guide DR planning.  