# KQL (Kusto Query Language) for Azure Administration

## What is KQL?
Kusto Query Language is the native query language for Azure Monitor Logs, Azure Data Explorer, and Microsoft Sentinel. It is designed to quickly analyze large volumes of telemetry data using a pipeline of operators separated by `|`.

## Basic Building Blocks
- **Table**: The source of data (e.g., `Heartbeat`, `Perf`, `Event`).
- **`where`**: Filter rows based on conditions (like SQL `WHERE`).
- **`project`**: Select specific columns (like SQL `SELECT`).
- **`summarize`**: Aggregate data (count, avg, max, min) and group by columns.
- **`bin()`**: Group time‑series data into fixed intervals (e.g., `bin(TimeGenerated, 1h)`).
- **`ago()`**: Specify a relative time offset (e.g., `ago(24h)` means the last 24 hours).

## How to Use These Queries
1. Open your Log Analytics workspace in the Azure portal.
2. Go to **Logs**.
3. Copy any query from `kql-queries.kusto` into the editor.
4. Adjust the time range (top right) if needed.
5. Click **Run**.

## Why These 15 Queries?
They cover the most frequent administrative tasks:
- **Availability and performance monitoring** (heartbeat, CPU, disk)
- **Security auditing** (failed logins, NSG rules, Azure activity)
- **Application health** (App Service errors, storage access, syslog)
- **Update compliance** (missing patches)

## Customization
All queries can be adapted by changing table names, time ranges, or aggregation intervals. For example, to see CPU over 30 minutes instead of 1 hour, change `bin(TimeGenerated, 1h)` to `bin(TimeGenerated, 30m)`.

## Note on Missing Data
If a query returns no results, the underlying data source (e.g., Security Events, NSG diagnostic logs) hasn’t been configured. The query is still valid and will work once the data is present. The `Perf` and `Heartbeat` queries should return data from your existing VMs.

## Screenshots

---
![alt text](<Screenshot 2026-07-29 211518.png>)
---
![alt text](<Screenshot 2026-07-29 211636.png>)
---

## Lessons Learned
- KQL is powerful for monitoring and troubleshooting.  
- Queries can be customized with filters and time ranges.  
- Essential for AZ‑104 exam and real-world Azure administration.  