# 06 – Capstone: End‑to‑End Solutions

This section brings together everything you've learned across identity, networking, compute, storage, monitoring, and infrastructure as code. The four capstone projects are designed to mirror real‑world enterprise scenarios, each one deploying a production‑grade solution with full documentation.

## Modules Overview

| Module | Folder | What You Built |
|--------|--------|----------------|
| **01 – Three‑Tier Secure App** | `01-three-tier-secure-app/` | A complete production‑like architecture: VNet with four subnets, NSGs with least‑privilege rules, two web VMs behind a public Load Balancer, app and database VMs (no public IPs), Azure Bastion, storage with private endpoint, Recovery Services vault with backup, Log Analytics and CPU alert, plus RBAC and Azure Policy. |
| **02 – Hub‑and‑Spoke Network** | `02-hub-and-spoke-network/` | A hub VNet containing a VPN gateway and an NVA, two spoke VNets for production and development, peering with gateway transit, and user‑defined routes forcing internet traffic through the NVA. |
| **03 – Disaster Recovery Setup** | `03-disaster-recovery-setup/` | A multi‑region DR solution protecting a VM (with ASR), a storage account (GRS), and an Azure SQL Database (active geo‑replication), including a failover runbook, RTO/RPO analysis, and a non‑disruptive test failover. |
| **04 – Infrastructure as Code Portfolio** | `04-infrastructure-as-code/` | Reusable Bicep modules for network, compute, storage, and monitoring, orchestrated by a main file with parameter files for dev/test/prod environments. |

## Key Skills Demonstrated

- **Architecture Design**: Applying cloud best practices to build secure, highly available, and resilient solutions.
- **Networking**: VNet peering, gateway transit, user‑defined routes, NSGs, private endpoints, and hub‑spoke topologies.
- **Security & Governance**: Least‑privilege access, Azure Policy, RBAC, backup, and encryption.
- **Disaster Recovery**: ASR replication, storage GRS failover, SQL geo‑replication, and operational runbooks.
- **Infrastructure as Code**: Modular Bicep templates, parameterisation, multi‑environment deployment, and reusable components.

## Deliverables
Each capstone folder contains detailed configuration files, diagrams, runbooks, and a dedicated README. Together they form a portfolio that proves you can architect, deploy, and secure Azure environments end‑to‑end – exactly what is expected in the AZ‑104 exam and in professional Azure administration roles.