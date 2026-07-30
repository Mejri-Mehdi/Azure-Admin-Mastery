# Azure Action Groups

## What Are Action Groups?
Action groups are collections of notification and remediation actions that can be triggered by Azure Monitor alerts. They decouple the “what to do” from the “when to do it”, allowing a single action group to be reused across multiple alert rules.

## Notification Types
| Type | Description | Use Case |
|------|-------------|----------|
| **Email** | Send an email to specified recipients. | Primary notification for on‑call staff. |
| **SMS** | Text message to a phone number. | Urgent alerts when email isn’t checked. |
| **Voice** | Automated phone call. | Critical escalations. |
| **Webhook** | HTTP POST to a custom endpoint. | Integration with ticketing systems, Slack, PagerDuty. |
| **Azure Function** | Trigger a serverless function. | Custom remediation or logging. |
| **Logic App** | Start a Logic App workflow. | Advanced orchestration (e.g., restart VM, scale out). |
| **Automation Runbook** | Execute an Azure Automation runbook. | Automated self‑healing tasks. |
| **ITSM** | Create an incident in an ITSM tool (ServiceNow, etc.). | Enterprise incident management. |

## Action Group Structure
- **Name** and **Short Name**: Identifiers used in alerts.
- **Actions**: One or more of the above types, each with a name and configuration (email address, phone number, URI, etc.).
- **Status**: Can be enabled/disabled without deleting the group.

## Our Implementation
- **ag-critical-alerts**: Sends email, SMS, and webhook for critical production issues (CPU spikes, storage outages).
- **ag-auto-remediation**: Sends webhook that could trigger an Automation runbook to restart a service or scale out.

Both groups are attached to the VM CPU alert, storage availability alert, and App Service error alert, ensuring multiple channels of notification.

## Best Practices
- Use a separate action group for different severity levels (e.g., critical, warning, informational).
- Test action groups periodically by triggering alerts or using the “Test action group” feature in the portal.
- Avoid hard‑coding email addresses; use distribution lists or service accounts for team notifications.

## Screenshots

---
![alt text](<Screenshot 2026-07-30 170016.png>)
---
![alt text](<Screenshot 2026-07-30 170050.png>)
---
![alt text](<Screenshot 2026-07-30 170141.png>)
---
![alt text](<Screenshot 2026-07-30 170251.png>)
---
![alt text](<Screenshot 2026-07-30 170326.png>)
---
![alt text](<Screenshot 2026-07-30 170432.png>)
---
![alt text](<Screenshot 2026-07-30 170507.png>)
---
![alt text](<Screenshot 2026-07-30 170554.png>)
---
![alt text](<Screenshot 2026-07-30 170731.png>)
---
![alt text](<Screenshot 2026-07-30 170838.png>)
---
![alt text](<Screenshot 2026-07-30 170843.png>)
---
![alt text](<Screenshot 2026-07-30 171002.png>)
---
![alt text](<Screenshot 2026-07-30 171058.png>)
---
![alt text](<Screenshot 2026-07-30 171122.png>)
---
![alt text](<Screenshot 2026-07-30 171255.png>)
---
![alt text](<Screenshot 2026-07-30 171306.png>)
---
![alt text](<Screenshot 2026-07-30 171758.png>)
---

## Lessons Learned
- Action groups unify notifications and automation.  
- Webhooks enable integration with external systems.  
- Logic Apps and Runbooks provide automated remediation.  