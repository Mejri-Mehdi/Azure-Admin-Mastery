# Azure Dashboard – Monitoring View

## What We Built
An **Azure-Admin-Dashboard** with eight tiles that give a one‑glance overview of critical infrastructure:

1. **VM CPU metrics** – line chart of average CPU usage.
2. **Storage account availability** – line chart of availability percentage.
3. **App Service requests** – request count over time.
4. **Log Analytics query** – top 10 error sources in Event logs.
5. **Advisor score** – overall recommendation health.
6. **Cost by resource group** – monthly cost bar chart.
7. **VM locations** – a markdown tile listing datacenter locations.
8. **Alert summary** – pie chart of fired alerts by severity.

## How to Use
- Open the Azure portal and select **Dashboard** → `Azure-Admin-Dashboard`.
- All tiles are interactive; click any chart to drill into the underlying metric or query.
- The dashboard updates automatically with the selected time range.

## Sharing and Collaboration
Dashboards can be **Private** (visible only to you) or **Shared** (visible to others in the subscription with appropriate RBAC).

- **Private dashboard**: Only the creator sees it. Good for personal views.
- **Shared dashboard**: Published as a shared resource; others with `Reader` access to the dashboard can view it. RBAC permissions on the underlying resources still apply – a user sees only data they have access to.

To share:
1. Open the dashboard.
2. Click **Share**.
3. Choose to share with the subscription or specific users.
4. Click **Share**.

The dashboard is stored as an Azure resource (JSON), so it can be version‑controlled and deployed via ARM or Bicep.

## Export / Import
- **Export**: Dashboard → **Export** → download `dashboard.json`.
- **Import**: Dashboard → **Upload** → select a JSON file.

## Best Practices
- Keep dashboards focused on a specific team or service (e.g., “Web‑app overview” vs. “Infrastructure health”).
- Use a shared dashboard for team visibility; pin the most critical metrics.
- Review and update tiles as services change.

## Screenshots

---
![alt text](<Screenshot 2026-07-30 174600.png>)
---
![alt text](<Screenshot 2026-07-30 174709.png>)
---
![alt text](<Screenshot 2026-07-30 174754.png>)
---
![alt text](<Screenshot 2026-07-30 174832.png>)
---
![alt text](<Screenshot 2026-07-30 175054.png>)
---
![alt text](<Screenshot 2026-07-30 175149.png>)
---
![alt text](<Screenshot 2026-07-30 175218.png>)
---
![alt text](<Screenshot 2026-07-30 175410.png>)
---
![alt text](<Screenshot 2026-07-30 175418.png>)
---
![alt text](<Screenshot 2026-07-30 175526.png>)
---
![alt text](<Screenshot 2026-07-30 175622.png>)
---
![alt text](<Screenshot 2026-07-30 175644.png>)
---
![alt text](<Screenshot 2026-07-30 175701.png>)
---
![alt text](<Screenshot 2026-07-30 175713.png>)
---

## Lessons Learned
- Dashboards unify monitoring across services.  
- Shared dashboards improve collaboration.  
- JSON export allows version control and reusability.  