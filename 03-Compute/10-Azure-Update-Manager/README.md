# Azure Update Manager

## What is Azure Update Manager?
Azure Update Manager is a free, native Azure service for patching both Windows and Linux VMs. It does **not** require a Log Analytics workspace or Automation account, unlike the old Update Management solution.

## Manual Patching vs. Update Manager
| Feature | Manual Patching | Update Manager |
|--------|------------------|----------------|
| **Scheduling** | None; admin must log in and patch. | Create maintenance windows (e.g., every Sunday 2 AM). |
| **Compliance** | No central view of missing updates. | Dashboard shows missing updates across all VMs. |
| **Orchestration** | Ad‑hoc, error‑prone. | Automatic, with reboots if needed. |
| **Cost** | Free, but requires admin time. | Free (no additional cost). |

## Key Concepts
- **Maintenance Configuration**: Defines a schedule, update classifications, reboot settings, and the scope of machines.
- **Assessments**: Can be on‑demand or automatic (every 12 hours) to identify missing updates.
- **Installations**: One‑time (manual) or scheduled via maintenance configurations.
- **Supported OS**: Windows Server / Client, Ubuntu, Red Hat, SUSE, Debian, etc.

## Our Configuration
- Created a maintenance configuration "SundayMaintenance" in East US.
- Schedule: every Sunday 2 AM – 5 AM (Eastern).
- Update classifications: Critical and Security.
- Reboot: If required.
- Assigned to VMs `vm-update1` and `vm-update2`.
- Ran an on‑demand assessment to verify missing updates, then installed them manually.

## Benefits
- **No extra infrastructure**: no Log Analytics, no Automation account.
- **Simplified compliance**: see all VMs and their patch status in one place.
- **Flexibility**: choose which updates to include/exclude, set deadlines, etc.

## Screenshots

---
![alt text](<Screenshot 2026-07-24 173421.png>)
---
![alt text](<Screenshot 2026-07-24 173425.png>)
---
![alt text](<Screenshot 2026-07-24 173628.png>)
---
![alt text](<Screenshot 2026-07-24 174210.png>)
---
![alt text](<Screenshot 2026-07-24 174220.png>)
---

## Lessons Learned
- Automated patching reduces manual effort and human error.  
- Critical/security updates can be enforced with scheduled maintenance.  
- On-demand assessments provide visibility into patch compliance.  