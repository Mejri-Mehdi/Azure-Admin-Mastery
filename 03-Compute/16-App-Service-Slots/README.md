# Deployment Slots in Azure App Service

## What are Deployment Slots?
Deployment slots are live environments within an App Service that allow you to stage updates, test them, and then swap into production with **zero downtime**.

## Why Use Slots?
- **Blue‑green deployment**: Deploy a new version to a staging slot, validate it, then swap. If something goes wrong, swap back instantly.
- **Preview changes**: Swap with preview lets you see how the target slot will behave before committing.
- **Configuration isolation**: App settings and connection strings can be marked as slot‑specific (sticky), so they don’t move during a swap.

## How Swap Works
- A swap exchanges the **content** (code) and **configuration** (non‑sticky settings) of two slots.
- The underlying infrastructure does not change; only the routing is updated.
- A swap with preview performs a “dry run” and warms up the destination to ensure the new code responds correctly.

## Slot‑Sticky Settings
- **Slot‑sticky** settings remain attached to the slot they were created on, even after a swap.  
  *Example*: a database connection string for the staging database should stay with staging, not move to production.
- **Non‑sticky** settings swap along with the slot content.

## Our Demonstration
- Deployed v1 to production and v2 to staging.
- Set a non‑sticky `Environment` setting and a slot‑sticky `SlotName` setting.
- Swapped slots; observed the version change and that the slot‑sticky setting remained with its original slot.

## Limitations
- Available only in Standard, Premium, and Isolated App Service plans.
- Auto‑swap can be configured on a slot to automatically trigger a swap after successful deployment.
- Slots share the same plan resources; scaling the plan affects all slots.

## Screenshots

---
![alt text](<Screenshot 2026-07-25 153124.png>)
---
![alt text](<Screenshot 2026-07-25 153138.png>)
---
![alt text](<Screenshot 2026-07-25 153309.png>)
---
![alt text](<Screenshot 2026-07-25 153321.png>)
---
![alt text](<Screenshot 2026-07-25 153908.png>)
---
![alt text](<Screenshot 2026-07-25 154037.png>)
---
![alt text](<Screenshot 2026-07-25 154118.png>)
---
![alt text](<Screenshot 2026-07-25 154411.png>)
---
![alt text](<Screenshot 2026-07-25 161306.png>)
---
![alt text](<Screenshot 2026-07-25 161740.png>)
---
![alt text](<Screenshot 2026-07-25 161933.png>)
---
![alt text](<Screenshot 2026-07-25 161939.png>)
---

## Lessons Learned
- Deployment slots simplify blue/green deployments.  
- Swap settings ensure environment-specific values remain sticky.  
- Swap with preview avoids cold start issues.  