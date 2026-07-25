# App Service Scaling – Scale‑Up vs Scale‑Out

## Definitions
- **Scale‑up (vertical)**: Change the App Service Plan tier or size (e.g., from S1 to S2). Increases CPU, RAM, disk per instance. There’s a brief downtime during the scale operation.
- **Scale‑out (horizontal)**: Add or remove instances (VMs) in the same plan. No downtime; new instances are added while existing ones continue serving traffic.
- **Autoscale**: Automatic scale‑out/in based on metrics like CPU percentage, memory, or queue length. Only available from Standard tier and above.

## How Autoscale Works in Our Lab
- **Trigger**: CPU percentage averaged over 10 minutes > 70%.
- **Action**: Add 1 instance, up to maximum 3.
- **Scale‑in**: When CPU < 20% for 10 minutes, remove 1 instance.
- **Cooldown**: 5 minutes (default) between successive scale actions.

## Limitations
- Autoscale is not available on Free, Shared, or Basic tiers.
- Max instances depend on plan tier (Standard = 10, Premium v2 = 20, Isolated = 100).
- CPU is measured at the plan level (average across all instances). So a single overloaded instance can trigger a scale‑out even if other instances are idle.
- Scaling takes a few minutes to add capacity; your application must handle temporary overloads gracefully.

## When to Use Which
- **Scale‑up** when your application is memory‑bound or needs features only available in higher tiers (deployment slots, private endpoints).
- **Scale‑out** when you have a stateless application that can benefit from load balancing across multiple instances (web apps, APIs).
- **Autoscale** for unpredictable traffic patterns, saving cost during low usage.

## Screenshots

---
![alt text](<Screenshot 2026-07-25 122523.png>)
---
![alt text](<Screenshot 2026-07-25 122725.png>)
---
![alt text](<Screenshot 2026-07-25 122816.png>)
---
![alt text](<Screenshot 2026-07-25 123639.png>)
---
![alt text](<Screenshot 2026-07-25 123654.png>)
---
![alt text](<Screenshot 2026-07-25 123829.png>)
---
![alt text](<Screenshot 2026-07-25 123929.png>)
---
![alt text](<Screenshot 2026-07-25 123947.png>)
---
![alt text](<Screenshot 2026-07-25 124124.png>)
---
![alt text](<Screenshot 2026-07-25 124853.png>)
---
![alt text](<Screenshot 2026-07-25 124958.png>)
---
![alt text](<Screenshot 2026-07-25 125211.png>)
---
![alt text](<Screenshot 2026-07-25 134634.png>)
---


## Lessons Learned
- Autoscale ensures performance under load.  
- Scale-out is horizontal scaling; scale-up is vertical scaling.  
- Plan tier determines maximum instance count.  