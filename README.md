# <img width="512" height="512" alt="image" src="https://github.com/user-attachments/assets/393f1321-2717-4254-9753-ca6e7d53226d" />  Azure Administrator Mastery — 86 Hands‑On Labs

> *"I didn't just study for AZ‑104. I built Azure. Every service. Every scenario. From zero to production‑grade infrastructure."*

---

## 🎯 At a Glance

| Metric                     | Value                                    |
|----------------------------|------------------------------------------|
| **Total Projects**         | 86 hands‑on labs                         |
| **Time Invested**          | 178+ hours                               |
| **Domains Covered**        | 5 AZ‑104 domains + Foundation + Capstone |
| **Infrastructure as Code** | 40+ Bicep templates, 25+ ARM templates   |
| **Automation Scripts**     | 120+ Azure CLI & PowerShell scripts      |
| **Environments Built**     | Dev, Test, Prod, DR, Hub‑and‑Spoke       |
| **Cost Strategy**          | Every lab built, tested, documented, then destroyed |

---

## 🏗️ What I Can Build

> *This isn’t a list of tutorials I followed. These are systems I architected, deployed, secured, monitored, and tore down — repeatedly, until I understood every layer.*

### 🔐 Identity & Governance
*"I can lock down an entire Azure estate."*

- **Microsoft Entra ID**: Full user lifecycle, dynamic groups, guest access, SSPR, license management
- **RBAC**: Built‑in roles, custom roles with granular `Actions` / `DataActions`, scope inheritance from Management Groups down to individual resources
- **Azure Policy**: Initiatives with remediation, tag enforcement, location restrictions, compliance dashboards
- **Governance Architecture**: Management Group hierarchies, resource locks, budgets with action groups, Advisor‑driven optimization

**What I can do for you:** Design least‑privilege access models, enforce organizational compliance at scale, and build governance frameworks that pass security audits.

### 💾 Storage
*"I can design storage that survives disasters and complies with regulations."*

- **Redundancy Spectrum**: Built and tested LRS → ZRS → GRS → RA‑GRS → GZRS, with documented failover behavior
- **Security**: Private Endpoints, Service Endpoints, firewall rules, SAS tokens (Account, Service, User Delegation), stored access policies, CMK encryption
- **Data Lifecycle**: Automated tiering (Hot → Cool → Cold → Archive), lifecycle policies, soft delete, versioning, immutability (WORM)
- **File Services**: Azure Files with SMB/NFS, identity‑based access, AzCopy bulk transfers, File Sync

**What I can do for you:** Architect cost‑optimized, compliant storage solutions with automated lifecycle management and military‑grade access control.

### 💻 Compute
*"I can deploy anything from a single VM to a self‑healing microservices platform."*

- **Virtual Machines**: Deployed via Portal, CLI, ARM, and Bicep — with disks, encryption, extensions, and Update Manager
- **High Availability**: Availability Sets (FD/UD), Availability Zones, VM Scale Sets with autoscale
- **Containers**: ACR with geo‑replication, ACI serverless containers, Container Apps with KEDA scaling
- **App Service**: Multi‑tier plans, deployment slots with swap settings, VNet integration, autoscale rules
- **Infrastructure as Code**: Modular Bicep templates, parameter files, decompilation, subscription‑level deployments

**What I can do for you:** Build resilient compute platforms, automate deployments with IaC, and optimize costs through right‑sizing and scaling strategies.

### 🌐 Networking
*"I can build networks that are secure by design."*

- **VNet Architecture**: 3‑tier subnets, CIDR planning, reserved IP management, Bastion integration
- **Security**: NSGs with granular rules, Application Security Groups, Azure Firewall concepts
- **Traffic Management**: Load Balancer (Layer 4), Application Gateway with path‑based routing & WAF
- **Connectivity**: VNet peering with gateway transit, VPN Gateway (Site‑to‑Site, VNet‑to‑VNet), ExpressRoute concepts
- **DNS**: Public DNS zones with alias records, Private DNS with auto‑registration
- **Private Connectivity**: Private Endpoints with DNS integration, Service Endpoints, UDRs with NVAs

**What I can do for you:** Design secure hub‑and‑spoke topologies, implement zero‑trust network architectures, and troubleshoot complex connectivity issues.

### 📊 Monitoring & Operations
*"I can see everything, back up everything, and recover from anything."*

- **Azure Monitor**: Log Analytics workspaces, Data Collection Rules, KQL query authoring, metric alerts
- **Visualization**: Shared dashboards, workbooks, VM Insights dependency maps
- **Backup & DR**: Recovery Services Vault, backup policies, file‑level recovery, VM restore, Azure Site Recovery with test failover
- **Proactive Management**: Service Health alerts, Advisor recommendations, budget governance

**What I can do for you:** Build observability stacks that prevent outages, design DR strategies with documented RTO/RPO, and automate operational responses.

---

## 🏆 Capstone Projects

> *These aren’t labs. These are production architectures I designed from scratch.*

### 🧱 Three‑Tier Secure Application
- **VNet**: 4 subnets (Web/App/DB/Bastion) with defense‑in‑depth NSGs
- **Compute**: 2 web VMs behind Standard Load Balancer, app VM, SQL VM
- **Security**: Private Endpoints for storage, RBAC for dev/ops teams, Azure Policy enforcement
- **Operations**: Log Analytics ingestion, CPU alerts, automated VM backup
- **IaC**: Fully deployed via modular Bicep with environment‑specific parameter files

### 🕸️ Hub‑and‑Spoke Network
- **Topology**: Central hub with shared services (DNS, NVA, VPN Gateway)
- **Spokes**: Production and Development VNets with controlled peering
- **Routing**: UDRs forcing traffic through hub NVA for inspection
- **Documentation**: Full network diagram with traffic flow analysis

### ⚡ Disaster Recovery Setup
- **Replication**: ASR replicating VMs East US → West US2
- **Storage**: GRS with cross‑region restore capability
- **Runbook**: Documented failover/failback procedures with calculated RTO/RPO
- **Testing**: Validated with non‑disruptive test failover

---

## 🛠️ Tech Stack

**Cloud Platform**  
![Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=flat&logo=microsoft-azure&logoColor=white)

**Infrastructure as Code**  
![Bicep](https://img.shields.io/badge/Bicep-5C2D91?style=flat) ![ARM](https://img.shields.io/badge/ARM_Templates-0078D4?style=flat) ![JSON](https://img.shields.io/badge/JSON-000000?style=flat&logo=json&logoColor=white)

**Automation**  
![Azure CLI](https://img.shields.io/badge/Azure_CLI-0078D4?style=flat&logo=azure-cli&logoColor=white) ![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=flat&logo=powershell&logoColor=white)

**Core Services**  
Compute: VMs, VMSS, App Service, Container Instances, Container Apps, ACR  
Networking: VNet, NSG, ASG, LB, App Gateway, VPN Gateway, Bastion, Private Link, DNS  
Storage: Blob, Files, Disks, Archive tiers, Lifecycle Management  
Identity: Entra ID, RBAC, Custom Roles, Azure Policy, Management Groups  
Monitoring: Log Analytics, Azure Monitor, KQL, Alerts, ASR, Backup

---

## 📂 Repository Structure

```
azure-admin-mastery/
├── 00-foundation/                                  # Portal, CLI, PowerShell, Bicep, ARM basics
│   ├── 01-azure-portal-navigation/
│   ├── 02-azure-cli-setup/
│   ├── 03-powershell-setup/
│   ├── 04-bicep-basics/
│   ├── 05-arm-template-basics/
│   ├── 06-resource-groups-and-tags/
│   ├── 07-cost-management-basics/
│   └── 08-naming-conventions/
├── 01-identity-governance/						    # Entra ID, RBAC, Policy, Locks, Budgets
│   ├── 01-entra-id-users-groups/
│   ├── 02-entra-id-licenses/
│   ├── 03-external-users-guest-access/
│   ├── 04-sspr-configuration/
│   ├── 05-rbac-built-in-roles/
│   ├── 06-rbac-custom-roles/
│   ├── 07-rbac-scope-inheritance/
│   ├── 08-azure-policy-initiatives/
│   ├── 09-resource-locks/
│   ├── 10-tags-and-tag-policies/
│   ├── 11-management-groups/
│   ├── 12-budgets-and-alerts/
│   └── 13-azure-advisor/
├── 02-storage/									    # Accounts, redundancy, tiers, lifecycle, security
│   ├── 01-storage-account-types/
│   ├── 02-redundancy-lrs-zrs-grs/
│   ├── 03-storage-firewalls-vnet-rules/
│   ├── 04-blob-storage-tiers/
│   ├── 05-blob-lifecycle-management/
│   ├── 06-blob-soft-delete-versioning/
│   ├── 07-sas-tokens-and-policies/
│   ├── 08-access-keys-rotation/
│   ├── 09-private-endpoint-storage/
│   ├── 10-azure-files-shares/
│   ├── 11-identity-based-access-files/
│   ├── 12-azcopy-and-storage-explorer/
│   ├── 13-object-replication/
│   └── 14-storage-encryption/
├── 03-compute/								    	# VMs, containers, App Service, IaC
│   ├── 01-vm-deployment-portal/
│   ├── 02-vm-deployment-cli/
│   ├── 03-vm-deployment-bicep/
│   ├── 04-vm-disks-and-encryption/
│   ├── 05-vm-resize-and-move/
│   ├── 06-availability-sets/
│   ├── 07-availability-zones/
│   ├── 08-vm-scale-sets/
│   ├── 09-vm-custom-script-extension/
│   ├── 10-azure-update-manager/
│   ├── 11-container-registry/
│   ├── 12-container-instances/
│   ├── 13-container-apps/
│   ├── 14-app-service-plan/
│   ├── 15-app-service-scaling/
│   ├── 16-app-service-slots/
│   ├── 17-app-service-networking/
│   ├── 18-arm-template-modify/
│   └── 19-bicep-deployment/
├── 04-networking/								   # VNets, NSGs, LB, App Gateway, VPN, DNS
│   ├── 01-vnet-and-subnets/
│   ├── 02-nsg-rules/
│   ├── 03-application-security-groups/
│   ├── 04-vnet-peering/
│   ├── 05-user-defined-routes/
│   ├── 06-public-ip-addresses/
│   ├── 07-azure-bastion/
│   ├── 08-azure-load-balancer/
│   ├── 09-application-gateway/
│   ├── 10-azure-dns-public/
│   ├── 11-azure-dns-private/
│   ├── 12-service-endpoints/
│   ├── 13-private-endpoints/
│   ├── 14-vpn-gateway/
│   ├── 15-expressroute-concepts/
│   └── 16-network-watcher/
├── 05-monitoring/								    # Logs, alerts, backup, Site Recovery
│   ├── 01-log-analytics-workspace/
│   ├── 02-data-collection-rules/
│   ├── 03-kql-queries/
│   ├── 04-metric-alerts/
│   ├── 05-action-groups/
│   ├── 06-azure-dashboard/
│   ├── 07-vm-insights/
│   ├── 08-recovery-services-vault/
│   ├── 09-vm-backup-restore/
│   ├── 10-azure-site-recovery/
│   ├── 11-backup-policies/
│   └── 12-azure-service-health/
├── 06-capstone/ 								   # Production-grade architectures
│   ├── 01-three-tier-secure-app/
│   ├── 02-hub-and-spoke-network/
│   ├── 03-disaster-recovery-setup/
│   └── 04-infrastructure-as-code/
└── README.md
```


> **Every folder contains:**  
> 📄 `README.md` — Architecture decisions and lessons learned  
> 📦 `*.bicep` / `*.json` — Infrastructure as Code  
> ⚙️ `*.sh` / `*.ps1` — Automation scripts  
> 🖼️ `screenshots/` — Before/during/after evidence  
> 🎨 `architecture.png` — Network diagrams and flow charts

---

## 💡 Key Learnings

- *"The exam tests whether you know the Microsoft way. These labs taught me **why** the Microsoft way exists."*
- **RBAC scope inheritance is subtle** – a role at subscription level cascades down, but a deny assignment anywhere stops everything.
- **Networking is layer‑upon‑layer** – Understanding that traffic hits NSG → Route Table → Destination → NSG again is the difference between a working app and a 3 AM outage.
- **Storage redundancy isn’t just ‘more copies’** – GRS gives you geo‑protection but you can’t read from secondary until failover. RA‑GRS can, but costs more. The right choice depends on the business requirement, not the feature list.
- **Bicep beats ARM for readability**, but you must understand ARM to debug Bicep. Decompilation isn’t perfect.
- **Governance is where senior admins live** – Anyone can deploy a VM. Few can design a policy framework that prevents 500 non‑compliant resources from ever existing.

---

## 🚀 What I’m Ready For

- **Azure Administrator** – Day‑one operational competence across compute, storage, networking, and identity
- **Infrastructure as Code Engineer** – Bicep/ARM templating, modular design, CI/CD‑ready deployments
- **Cloud Security** – Zero‑trust network design, least‑privilege access, compliance enforcement
- **Site Reliability** – Monitoring, alerting, backup strategies, disaster recovery runbooks

---

## 📜 Certification

**AZ‑104: Microsoft Azure Administrator**  
*Prepared through 178 hours of deliberate hands‑on practice, not memorization.*

---

> *"Theory is when you know everything but nothing works.  
> Practice is when everything works but you don't know why.  
> This repo is where theory and practice met — 86 times."*

---

⭐ *If this repository helps your Azure journey, give it a star. If you’re hiring, let’s talk.*
