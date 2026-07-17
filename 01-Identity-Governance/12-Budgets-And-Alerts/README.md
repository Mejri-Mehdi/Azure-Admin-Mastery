# Budgets, Alerts, and Advisor

## Budgets vs Alerts vs Advisor

| Feature | Purpose | Example |
|--------|---------|---------|
| **Budgets** | Define a spending limit and get notified when actual or forecasted spend hits thresholds (e.g., 50%, 80%, 100%). | “Notify me when my monthly subscription cost reaches $16 (80% of $20).” |
| **Alerts (Metric/Anomaly)** | Trigger based on actual metric conditions. Cost anomaly alerts use ML to detect unusual spending patterns. | “Alert me when there’s an unexpected spike in daily cost compared to the last 30 days.” |
| **Advisor** | Provides personalized best practice recommendations for cost optimization, security, reliability, and performance. | “Advisor suggests deleting an idle public IP to reduce costs.” |

## How They Work Together
1. **Budgets** keep you informed about planned spending and prevent bill shock.
2. **Anomaly alerts** catch unexpected spikes that budgets might miss if the overall budget hasn’t been reached yet.
3. **Advisor** continuously scans your environment for savings opportunities you may not have considered.

## Our Implementation
- **Subscription budget**: `Lab-Budget` ($20/month) with alerts at 50%, 80%, and 100%. Action group sends email + SMS at 80% and 100%.
- **Resource group budget**: `Prod-Budget` on `rg-prod-app01` ($5/month) with 100% alert.
- **Anomaly alert**: `Anomaly-detection-alert` linked to the same action group, using ML to detect spending anomalies.
- **Advisor recommendations**: Documented three cost optimizations.

## Important Notes
- Budget alerts are evaluated up to once per day and can use either **actual** or **forecasted** spend.
- Anomaly alerts require several days of historical data to establish a baseline.
- Advisor recommendations are free and can be exported or dismissed.

---

## Lessons Learned
- Budgets enforce spending discipline.  
- Alerts provide real-time notifications for anomalies.  
- Advisor highlights optimization opportunities.  
- Combining all three ensures proactive cost governance.  