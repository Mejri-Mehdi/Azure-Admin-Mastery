# Azure Service Health – Health Monitoring Hierarchy

## Understanding the Three Levels
Azure provides health visibility at three distinct layers:

1. **Azure Status** (global)  
   - Public page: [status.azure.com](https://status.azure.com)  
   - Shows broad service outages across all regions.  
   - Not personalized; anyone can view it.

2. **Service Health** (subscription‑scoped)  
   - Accessed via the Azure Portal (search “Service Health”).  
   - Shows incidents that **specifically affect your resources**, including service issues, planned maintenance, and health advisories.  
   - You can configure alerts to be notified proactively.

3. **Resource Health** (individual resource)  
   - Provides the health status of a specific resource (VM, database, etc.).  
   - Can diagnose why a VM is unavailable (e.g., hardware failure, guest OS crash).  
   - Often the first place to check when a single resource behaves abnormally.

## How We Use Them
- **Azure Status**: Quick check for major outages before troubleshooting.
- **Service Health**: Subscribed to alerts for our East US region; any service‑impacting event sends an email.
- **Resource Health**: Monitored per critical VM; if a VM becomes unavailable, an alert is triggered immediately.

## Setting Up Alerts
- **Service Health alerts** are based on the Activity Log category `ServiceHealth`.
- **Resource Health alerts** are based on the Activity Log category `ResourceHealth`.
- Both can be linked to an Action Group for email, SMS, or automated remediation.

## Best Practices
- Create Service Health alerts for all production regions.
- Set up Resource Health alerts for every business‑critical resource.
- Combine with Azure Service Health dashboards to share status with teams.

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

## Lessons Learned
- Service Health provides subscription‑specific visibility.  
- Resource Health ensures granular monitoring of VMs and services.  
- Alerts improve readiness and response to outages. 