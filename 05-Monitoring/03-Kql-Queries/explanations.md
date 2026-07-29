# KQL Query Explanations

Each query addresses a common monitoring or troubleshooting scenario.

| # | Query Purpose | Key Operators | Expected Output |
|---|---------------|---------------|-----------------|
| 1 | Find VMs that haven't reported recently | `where`, `summarize`, `ago()` | Last heartbeat time per computer |
| 2 | CPU trend over time | `where`, `summarize`, `bin()` | Hourly average CPU per machine |
| 3 | Application errors count | `where`, `summarize` | Number of errors per computer |
| 4 | Detect brute‑force attempts | `where`, `summarize` | Failed logins per user per computer |
| 5 | Audit who created VMs | `where`, `project` | Timestamp, caller, resource group |
| 6 | NSG rule hits | `where`, `summarize` | Count of allowed/denied events by direction |
| 7 | Top inbound connections | `where`, `summarize` | Source IP and destination port for inbound traffic |
| 8 | Critical alerts | `where`, `project` | Time, alert name, description for Sev1 alerts |
| 9 | Storage blob access patterns | `where`, `summarize` | IP addresses reading blobs and their user agents |
| 10 | App Service error pages | `where`, `summarize` | URL stems and HTTP status codes for errors |
| 11 | VM CPU peaks | `where`, `summarize` | Maximum CPU per resource from Azure Metrics |
| 12 | Linux syslog errors | `where`, `summarize` | Count of errors per host and process |
| 13 | Pending security updates | `where`, `summarize` | Missing updates per computer |
| 14 | Failed Azure operations | `where`, `project` | Failed operations with caller and time |
| 15 | Low disk space | `where`, `summarize` | Minimum free megabytes per disk |

## Data Availability
- Queries 1–3, 11, 15 use `Perf` and `Heartbeat` tables that are populated by default when the Azure Monitor Agent is configured.
- Queries 4, 6–10, 12–14 require additional data sources (Security Events, NSG flow logs, VM insights, storage diagnostics, etc.). These queries will return empty results unless those data sources are enabled. The query syntax is correct and can be used once the data is onboarded.