# Metric and Activity Log Alerts

## Alert Rule Structure
Every alert rule consists of:
1. **Scope**: The resource(s) being monitored.
2. **Signal**: The type of data (metric, log, activity).
3. **Condition**: The threshold and aggregation logic.
4. **Severity**: The impact level (0‑4).
5. **Action Group** (optional): Where to send notifications.

## Metric Alerts
- Can use static thresholds (e.g., CPU > 80) or dynamic thresholds (machine‑learning based, adjusts automatically).
- Support multiple time aggregations (Average, Minimum, Maximum, Total, Count).
- Evaluation frequency can be as low as 1 minute.

## Activity Log Alerts
- Triggered when specific operations occur in the subscription.
- Useful for security auditing and governance (e.g., “Notify me if someone creates a new NSG”).

## Our Implementation
1. **VM CPU Alert**: Seizure warning when any VM exceeds 80% CPU for 5 minutes.
2. **Storage Availability Alert**: Triggers if storage account availability drops below 99%, indicating potential outage.
3. **App Service HTTP 5xx Alert**: Alerts when the web app returns 10 or more server errors within 5 minutes.
4. **NSG Write Activity Alert**: Monitors administrative operations on NSGs, raising an alert whenever an NSG is created or modified.

## Testing Alerts
- Metric alerts will remain “Fired” only when conditions are met. You can simulate CPU spike with a stress tool or observe the alert history.
- Activity log alerts will fire when you perform the monitored action (e.g., update an NSG in the portal).

## Screenshots

---
![alt text](<Screenshot 2026-07-30 154441.png>)
---
![alt text](<Screenshot 2026-07-30 160638.png>)
---
![alt text](<Screenshot 2026-07-30 160737.png>)
---
![alt text](<Screenshot 2026-07-30 160902.png>)
---
![alt text](<Screenshot 2026-07-30 160913.png>)
---
![alt text](<Screenshot 2026-07-30 160948.png>)
---
![alt text](<Screenshot 2026-07-30 161150.png>)
---
![alt text](<Screenshot 2026-07-30 161224.png>)
---
![alt text](<Screenshot 2026-07-30 161231.png>)
---
![alt text](<Screenshot 2026-07-30 161245.png>)
---
![alt text](<Screenshot 2026-07-30 163050.png>)
---
![alt text](<Screenshot 2026-07-30 163431.png>)
---
![alt text](<Screenshot 2026-07-30 163522.png>)
---
![alt text](<Screenshot 2026-07-30 163600.png>)
---
![alt text](<Screenshot 2026-07-30 163759.png>)
---
![alt text](<Screenshot 2026-07-30 164104.png>)
---
![alt text](<Screenshot 2026-07-30 164131.png>)
---
![alt text](<Screenshot 2026-07-30 164137.png>)
---
![alt text](<Screenshot 2026-07-30 164153.png>)
---
![alt text](<Screenshot 2026-07-30 164339.png>)
---

## Lessons Learned
- Alerts can be scoped to VM, resource, or subscription.  
- Signal type determines what data is evaluated.  
- Severity levels help prioritize response.  
- Dynamic thresholds reduce false positives.  