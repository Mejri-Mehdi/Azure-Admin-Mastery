# 03 – Compute: Virtual Machines, Containers & App Services

This section covers the full spectrum of Azure compute services – from provisioning individual VMs through portals, CLIs, and ARM/Bicep templates, to high‑availability configurations, container workloads, and App Service management. You built, configured, secured, and scaled real resources across 19 hands‑on modules.

## Modules Overview

| Module | Folder | What You Built |
|--------|--------|----------------|
| **01 – VM Deployment via Portal** | `01-vm-deployment-portal/` | Deployed Windows and Linux VMs using the Azure portal, documenting every blade and choice (disk, networking, boot diagnostics). |
| **02 – VM Deployment via CLI** | `02-vm-deployment-cli/` | Re‑created the same VMs entirely with Azure CLI, emphasizing explicit resource creation, idempotency, and scripting. |
| **03 – VM Deployment via Bicep** | `03-vm-deployment-bicep/` | Built a modular Bicep template (main, NIC module) with parameters, outputs, and deployed using a parameter file. |
| **04 – VM Disks & Encryption** | `04-vm-disks-and-encryption/` | Attached a Premium SSD data disk, enabled Azure Disk Encryption (BitLocker) with Key Vault, took snapshots, and cloned disks. |
| **05 – VM Resize and Move** | `05-vm-resize-and-move/` | Resized a VM after deallocation, moved a VM and its dependencies to a different resource group, and documented cross‑region move limitations. |
| **06 – Availability Sets** | `06-availability-sets/` | Created an Availability Set with 2 fault domains / 5 update domains, deployed two VMs, verified fault domain distribution, and compared SLAs. |
| **07 – Availability Zones** | `07-availability-zones/` | Deployed two VMs in Zone 1 and Zone 2, placed them behind a zone‑redundant load balancer, tested web traffic across zones, and compared zonal vs. zone‑redundant resources. |
| **08 – VM Scale Sets** | `08-vm-scale-sets/` | Created a Uniform VMSS with autoscaling based on CPU, installed nginx and stress, generated load, observed scale‑out/scale‑in, and exported autoscale rules. |
| **09 – VM Custom Script Extension** | `09-vm-custom-script-extension/` | Deployed Windows and Linux VMs that automatically installed IIS/nginx using custom scripts stored in blob storage, demonstrating post‑provisioning automation. |
| **10 – Azure Update Manager** | `10-azure-update-manager/` | Created a maintenance configuration for Sunday patching, assigned VMs, ran on‑demand assessments, and applied critical/security updates. |
| **11 – Container Registry** | `11-container-registry/` | Provisioned a private ACR (Standard tier), pushed a custom nginx image, enabled content trust, and configured geo‑replication to West US 2. |
| **12 – Container Instances** | `12-container-instances/` | Deployed a serverless container with a public DNS label, viewed logs, exec’d into the container, and compared ACI to other compute options. |
| **13 – Container Apps** | `13-container-apps/` | Built a microservice on Azure Container Apps, pulled the image from ACR, configured HTTP‑based KEDA scaling, and tested auto‑scale with load generation. |
| **14 – App Service Plan** | `14-app-service-plan/` | Created a Free (F1) App Service Plan and scaled it up through Basic, Standard, and Premium, documenting the new features unlocked at each tier. |
| **15 – App Service Scaling** | `15-app-service-scaling/` | Configured CPU‑based autoscale for an App Service Plan, generated sustained load, and observed scale‑out/scale‑in events (including troubleshooting quota issues). |
| **16 – App Service Slots** | `16-app-service-slots/` | Deployed production and staging slots with different code versions, configured slot‑sticky app settings, performed a swap with preview, and verified behavior. |
| **17 – App Service Networking** | `17-app-service-networking/` | Integrated a web app with a VNet for outbound access, added a Private Endpoint for inbound private access, and configured Access Restrictions for IP whitelisting. |
| **18 – ARM Template Modify** | `18-arm-template-modify/` | Exported an ARM template from an existing VM, cleaned it up, added parameters, variables, outputs, explicit `dependsOn`, and deployed the modified version. |
| **19 – Bicep Deployment** | `19-bicep-deployment/` | Decompiled the ARM template to Bicep, refactored into networking/compute modules, created a `.bicepparam` file, deployed, and compared the exported ARM with the original. |

## Key Concepts Covered
- **Infrastructure‑as‑Code**: ARM templates (JSON), Bicep (modular, parameterized), CLI scripting – consistent, repeatable deployments.
- **High Availability**: Availability Sets (fault/update domains) vs. Availability Zones (physical datacenter isolation), SLAs, and zone‑redundant services.
- **Scaling**: VMSS autoscale (CPU, custom metrics), App Service autoscale (scale‑out vs. scale‑up), container‑based KEDA scaling.
- **Disk & Encryption**: Managed disk types (Standard HDD to Ultra), Azure Disk Encryption with Key Vault, snapshots and disk cloning.
- **Container Compute**: ACR (private registry, geo‑replication), ACI (serverless), Container Apps (managed Kubernetes, revisions, scaling).
- **App Service Management**: Plans (tiers and features), deployment slots (blue/green, swap with preview), networking (VNet integration, Private Endpoint, Access Restrictions).
- **Automation & Extensions**: Custom Script Extension for post‑deployment configuration, Azure Update Manager for automated patching.
- **Troubleshooting & Real‑World**: Quota restrictions, spending limits, resource locks, policy conflicts – you encountered and documented these, turning roadblocks into learning.

## Deliverables
Each module contains configuration files, scripts, diagrams, and a dedicated README. Together they form a complete compute administration portfolio, directly aligned with the AZ‑104 exam objectives.