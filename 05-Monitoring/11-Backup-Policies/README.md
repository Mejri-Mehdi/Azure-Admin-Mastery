# Backup Policies – Designing for Workloads

## Policy Design Considerations
- **RPO (Recovery Point Objective)**: How much data loss is acceptable? Use hourly for near‑zero RPO; daily for less critical data.
- **RTO (Recovery Time Objective)**: How fast must you recover? Combined with Instant Restore, daily policies often suffice.
- **Retention**: Legal/compliance requirements dictate how long backups must be kept. GFS (Daily‑Weekly‑Monthly) satisfies many regulations.
- **Cost**: More frequent backups and longer retention increase storage costs. Balance according to priority.

## Our Policies
1. **Daily-30Days** – Basic protection for dev/test or low‑priority VMs.
2. **Daily-Weekly-Monthly** – Production workloads needing long‑term point‑in‑time recovery.
3. **Hourly-Critical** – Extremely low RPO for critical systems (e.g., financial transactions).

## Vault Choice
- We used a **Recovery Services Vault** for VM backup because it’s the only supported vault for Azure VMs.
- We created a **Backup Vault** as a demonstration of the newer service for disk/blob backup. In practice, you would use Backup Vault for managed disks or storage accounts, not VMs.

## Testing and Verification
- Policies are assigned to three test VMs.
- You can trigger on‑demand backups and view recovery points to verify each policy.
- Use `az backup job list` to monitor backup jobs.

## Screenshots

---
![alt text](<Screenshot 2026-08-01 132256.png>)
---
![alt text](<Screenshot 2026-08-01 132305.png>)
---
![alt text](<Screenshot 2026-08-01 132451.png>)
---
![alt text](<Screenshot 2026-08-01 132619.png>)
---
![alt text](<Screenshot 2026-08-01 132729.png>)
---
![alt text](<Screenshot 2026-08-01 132902.png>)
---
![alt text](<Screenshot 2026-08-01 133154.png>)
---
![alt text](<Screenshot 2026-08-01 133213.png>)
---
![alt text](<Screenshot 2026-08-01 133232.png>)
---
![alt text](<Screenshot 2026-08-01 133403.png>)
---
![alt text](<Screenshot 2026-08-01 133500.png>)
---
![alt text](<Screenshot 2026-08-01 133731.png>)
---
![alt text](<Screenshot 2026-08-01 133934.png>)
---
![alt text](<Screenshot 2026-08-01 134213.png>)
---
![alt text](<Screenshot 2026-08-01 134332.png>)
---
![alt text](<Screenshot 2026-08-01 134350.png>)
---
![alt text](<Screenshot 2026-08-01 134543.png>)
---
![alt text](<Screenshot 2026-08-01 134611.png>)
---
![alt text](<Screenshot 2026-08-01 134621.png>)
---

## Lessons Learned
- Different workloads require different backup frequencies and retention.  
- Recovery Services Vault and Backup Vault serve distinct purposes.  
- GFS policies are essential for compliance scenarios.  