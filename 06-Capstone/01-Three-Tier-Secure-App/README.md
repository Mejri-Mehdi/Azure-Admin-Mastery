# Three‑Tier Secure Application Architecture

## Overview
This deployment implements a classic three‑tier architecture (web, application, database) on Azure with strong network segmentation, load balancing, backup, and monitoring.

## Architecture Layers
- **Web tier**: Two Windows VMs behind a public Standard Load Balancer. Only HTTP/HTTPS allowed from the internet.
- **App tier**: One Linux VM running business logic, accessible only from the web tier on port 8080.
- **DB tier**: One Windows VM (SQL) accessible only from the app tier on port 1433.

## Security Controls
- Network Security Groups with least‑privilege rules.
- No public IPs on app or DB VMs; Bastion for management.
- Storage account for logs accessed via Private Endpoint.
- Azure Policy enforces CostCenter tag and allowed regions.
- RBAC: Dev team Contributor, Ops team Reader on the resource group.

## Backup & Monitoring
- All VMs backed up daily with 30‑day retention.
- Log Analytics workspace collects diagnostics.
- CPU alert for web tier.

## Deployment
Deploy with `az deployment group create --template-file main.bicep --parameters adminUsername=... adminPassword=...`.
Then run post‑deployment scripts for load balancer backend association, backup enablement, RBAC, and policy assignments.

## Architecture Diagram

---
---
---

## Screenshots

---
---
---
---




## Lessons Learned
- Proper subnet isolation enforces security boundaries.
- RBAC and policy ensure governance and compliance.
- Monitoring and backup provide resilience and visibility.