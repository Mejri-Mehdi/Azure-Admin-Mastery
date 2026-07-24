# Azure Container Registry (ACR)

## What is ACR?
Azure Container Registry is a managed, private Docker registry that stores and manages container images and related artifacts. It supports Docker images, Helm charts, OCI artifacts, and more.

## ACR Tiers and Features

| Tier | Use Case | Features | Price (approx.) |
|------|----------|----------|------------------|
| **Basic** | Dev/test, low traffic | 10 GB storage, 2 webhooks | $0.17/day |
| **Standard** | Production, geo‑replication | 100 GB storage, 10 webhooks, 1 replica | $0.67/day |
| **Premium** | High throughput, availability zones, private endpoints | 1 TB storage, 500 webhooks, 15 replicas, zone redundancy, content trust | $1.67/day |

All tiers include:
- Entra ID authentication (service principal / managed identity)
- Image scanning (optional, with Microsoft Defender for Cloud)
- Docker Content Trust (signing) – Premium required for policy enforcement, but client‑side signing works on all tiers if you handle keys.

## Why Use ACR?
- **Private**: images are not exposed to the public internet.
- **Integrated**: works seamlessly with AKS, App Service, Container Instances, and Azure DevOps.
- **Global**: geo‑replication for low‑latency pulls worldwide.

## Our Lab
- Created a Standard tier ACR in East US.
- Pushed a custom `nginx` image.
- Enabled content trust policy.
- Set up geo‑replication to West US 2.
- All commands are captured in `acr-commands.sh`.

## Screenshots

---
![alt text](<Screenshot 2026-07-24 191044.png>)
---
![alt text](<Screenshot 2026-07-24 190306.png>)
---
![alt text](<Screenshot 2026-07-24 191002.png>)
---
![alt text](<Screenshot 2026-07-24 191446.png>)
---

## Lessons Learned
- ACR provides secure, private image storage.  
- Geo-replication improves resilience and performance.  
- Content trust enforces image integrity.  