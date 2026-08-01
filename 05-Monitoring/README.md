# 05 – Monitoring: Insights, Alerts, and Backup

This section covers end‑to‑end Azure monitoring and business continuity. You centralized logs, built a KQL query library, created metric and log alerts, designed dashboards, enabled VM insights, configured backup policies, and set up disaster recovery with Azure Site Recovery. Each module adds a layer of operational visibility and resilience.

## Modules Overview

| Module | Folder | What You Built |
|--------|--------|----------------|
| **01 – Log Analytics Workspace** | `01-log-analytics-workspace/` | Created a centralized Log Analytics workspace, installed Azure Monitor Agent on Windows and Linux VMs, configured Data Collection Rules for performance counters and syslog, and set 90‑day data retention. |
| **02 – Data Collection Rules** | `02-data-collection-rules/` | Built multiple DCRs to collect specific Windows Event Logs (Error/Warning) and performance counters; layered multiple rules on the same VM, exported DCR JSON, and verified data with KQL. |
| **03 – KQL Queries** | `03-kql-queries/` | Wrote and tested 15 essential Kusto queries covering heartbeat, CPU, errors, failed logins, NSG events, Azure activity, and more. Documented each query’s purpose and operators. |
| **04 – Metric Alerts** | `04-metric-alerts/` | Created metric alerts for VM CPU >80%, storage availability <99%, and App Service HTTP 5xx >10; added an Activity Log alert for NSG writes. Exported all alert rules as JSON. |
| **05 – Action Groups** | `05-action-groups/` | Built two action groups: `ag-critical-alerts` (email, SMS, webhook) and `ag-auto-remediation` (webhook for auto‑healing). Linked them to alerts and tested notifications. |
| **06 – Azure Dashboard** | `06-azure-dashboard/` | Designed a monitoring dashboard with eight tiles: VM CPU, storage availability, App Service requests, Log Analytics query, Advisor score, cost chart, VM locations map, and alert summary. Exported the dashboard JSON. |
| **07 – VM Insights** | `07-vm-insights/` | Enabled VM Insights on two VMs (AMA + Dependency Agent), viewed Performance and Map data, created a custom workbook "VM Performance Summary" with parameters and KQL queries. |
| **08 – Recovery Services Vault** | `08-recovery-services-vault/` | Created a GRS vault with soft delete and cross‑region restore enabled. Defined a daily backup policy with 30‑day daily, 12‑week weekly, and 12‑month monthly retention. Protected two VMs and triggered an on‑demand backup. |
| **09 – VM Backup and Restore** | `09-vm-backup-restore/` | Performed file‑level recovery (mounted backup as a drive), restored a full VM to a new VM, and tested the restored VM. Documented the three restore types and the read‑only nature of file‑level recovery. |
| **10 – Azure Site Recovery** | `10-azure-site-recovery/` | Replicated a Windows VM from East US to West US2 using ASR. Ran a non‑disruptive test failover into an isolated VNet, verified the test VM, and cleaned up. Documented RTO and RPO based on observed behavior. |
| **11 – Backup Policies** | `11-backup-policies/` | Designed three backup policies: Daily‑30Days, Daily‑Weekly‑Monthly (GFS), and Hourly‑Critical (every 4h). Assigned each to a different VM. Created a Backup Vault and compared it with the Recovery Services vault. |
| **12 – Azure Service Health** | `12-azure-service-health/` | Reviewed the Service Health dashboard (issues, maintenance, advisories). Created a Service Health alert for East US and a Resource Health alert for a specific VM, both linked to an action group. |

## Key Concepts Learned

- **Centralized Logging**: Log Analytics workspace as the hub for all monitoring data, with Data Collection Rules controlling ingestion.
- **Monitoring Agents**: Transition from legacy agents to Azure Monitor Agent (AMA) and Dependency Agent.
- **Kusto Query Language (KQL)**: Core skill for querying logs – `where`, `summarize`, `project`, `bin()`, `ago()`.
- **Alerting**: Metric alerts, Activity Log alerts, alert conditions, severity, and action groups for notifications and auto‑remediation.
- **Dashboards & Workbooks**: Custom views for metrics and logs; workbooks as interactive, parameterized reports.
- **VM Insights**: Performance counters, process/connection maps, and dependency monitoring.
- **Backup & Recovery**: Recovery Services vault (policy design, retention, file‑level recovery, VM restore), Backup Vault for newer services.
- **Disaster Recovery**: Azure Site Recovery for cross‑region replication, test failover, RTO/RPO analysis.
- **Service Health**: Three‑level health visibility (Azure Status, Service Health, Resource Health) and proactive alerting.

## Deliverables
Each module folder contains configuration files, exported JSON, test results, and a dedicated README. Together they form a complete monitoring and business continuity portfolio, aligned with AZ‑104 exam objectives.