# Alert Signal Types

| Signal Type | Data Source | Example Alerts | Use Case |
|-------------|-------------|----------------|----------|
| **Metric** | Numeric values collected at regular intervals (CPU, memory, storage availability, HTTP errors) | CPU > 80%, Storage availability < 99%, HTTP 5xx count > 10 | Real‑time performance and health monitoring |
| **Activity Log** | Operations performed on Azure resources (who, what, when) | NSG creation/update, VM deletion, policy assignment | Auditing, security, compliance |
| **Log Search** | Custom KQL queries against Log Analytics workspace | Specific event patterns, correlation rules | Complex conditions not captured by a single metric |

## How Alerts Are Structured
- **Signal**: The underlying data stream (metric, activity log, or log query).
- **Condition**: The threshold and evaluation logic (e.g., average over 5 minutes, count over 10).
- **Action Group**: Who to notify (email, SMS, webhook, ITSM). (Not configured in this lab but typically added.)
- **Severity**: Critical (0), Error (1), Warning (2), Informational (3), Verbose (4).

## Our Alerts
- **Metric**: VM CPU, storage availability, App Service HTTP 5xx.
- **Activity Log**: NSG write operations.
- These cover the most common signal types administrators rely on.