# App Service Plan vs App Service

## What is an App Service Plan?
An App Service Plan is the compute resource (a collection of VMs) that hosts your web apps, API apps, mobile apps, and function apps. It defines the region, instance size, scale count, and pricing tier.

## What is a Web App (App Service)?
A Web App is the actual application that runs **on** the plan. It contains your code, configuration, and endpoint. A single plan can host multiple web apps, which share the same underlying VMs.

## Analogy
Think of an **App Service Plan** as a hotel building with rooms (instances). Each **Web App** is a guest staying in one or more rooms. You can put many guests in the same building (cheaper), or give a guest a dedicated building (isolated).

## Our Lab
1. Created a Free (F1) App Service Plan and a Node.js web app.
2. Scaled up to Basic (B1) – gained custom domains, SSL, SLA.
3. Scaled up to Standard (S1) – gained deployment slots for staging.
4. Scaled up to Premium (P1v2) – gained auto‑scale and private endpoints.
5. Created a second web app in the same plan, demonstrating resource sharing.

## Important Facts
- Scaling a plan affects **all apps** in it (they all get more resources).
- You can scale **up** (change tier) or **out** (add instances).
- The Free and Shared tiers run on shared VMs (other customers on same hardware); Basic and above use dedicated VMs.
- Isolated tier (not covered) runs in a dedicated App Service Environment.

## Screenshots

---
![alt text](<Screenshot 2026-07-25 113639.png>)
---
![alt text](<Screenshot 2026-07-25 113358.png>)
---
![alt text](<Screenshot 2026-07-25 113449.png>)
---
![alt text](<Screenshot 2026-07-25 113651.png>)
---
![alt text](<Screenshot 2026-07-25 113745.png>)
---
![alt text](<Screenshot 2026-07-25 113806.png>)
---
![alt text](<Screenshot 2026-07-25 114003.png>)
---
![alt text](<Screenshot 2026-07-25 114054.png>)
---
![alt text](<Screenshot 2026-07-25 114237.png>)
---
![alt text](<Screenshot 2026-07-25 114253.png>)
---
![alt text](<Screenshot 2026-07-25 114435.png>)
---
![alt text](<Screenshot 2026-07-25 114502.png>)
---
![alt text](<Screenshot 2026-07-25 114512.png>)
---
![alt text](<Screenshot 2026-07-25 114825.png>)
---
![alt text](<Screenshot 2026-07-25 114921.png>)
---
![alt text](<Screenshot 2026-07-25 114941.png>)
---

## Lessons Learned
- Scaling up unlocks advanced features (slots, autoscale, networking).  
- Multiple apps can share one plan, reducing costs.  
- Premium and Isolated tiers are best for production workloads.  