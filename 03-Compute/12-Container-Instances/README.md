# Azure Container Instances (ACI)

## What is ACI?
Azure Container Instances is a serverless container runtime that provides a fast, on‑demand way to run containers without managing any underlying VMs or orchestration.

## ACI Use Cases
- **Burst workloads**: Run a short‑lived container job (e.g., batch processing, CI/CD pipeline agent) and pay only for the seconds it runs.
- **Simple web apps**: Quickly expose a containerized app to the internet with a public IP and DNS label.
- **Event‑driven tasks**: Trigger a container via Azure Logic Apps or Functions.
- **Testing and development**: Spin up a container, test it, then delete it.

## How ACI Differs from Other Azure Container Options
| Feature | ACI | AKS | App Service for Containers |
|---------|-----|-----|-----------------------------|
| **Orchestration** | None (single container or group) | Kubernetes | Managed platform |
| **Scaling** | Manual / event‑driven | Automatic (cluster autoscaler) | Automatic (scale out) |
| **Networking** | Public IP or private VNet | Full network model | Integrated with App Service |
| **Billing** | Per second CPU/memory | Per VM (node pool) | Per App Service Plan |
| **Management** | No VM management | Kubernetes cluster management | Fully managed |

## Our Lab
- Deployed `nginx:latest` in an ACI container with a public DNS label.
- Verified it served the default Nginx page.
- Retrieved logs showing start‑up and web request activity.
- Executed a shell inside the container to inspect the environment.
- Restarted the container and confirmed its quick recovery.
- Deleted the container to stop billing.

## Key Commands
```powershell
# Create
az container create --resource-group rg-aci-lab --name nginx-container --image nginx --ports 80 --dns-name-label myaci2026xyz --location eastus

# Logs
az container logs -g rg-aci-lab -n nginx-container

# Exec
az container exec -g rg-aci-lab -n nginx-container --exec-command "/bin/bash"

# Delete
az container delete -g rg-aci-lab -n nginx-container --yes
```

## Screenshots

---
![alt text](<Screenshot 2026-07-24 195608.png>)
---
![alt text](<Screenshot 2026-07-24 195708.png>)
---
![alt text](<Screenshot 2026-07-24 200348.png>)
---
![alt text](<Screenshot 2026-07-24 201051.png>)
---
![alt text](<Screenshot 2026-07-24 201202.png>)
---

## Lessons Learned
- ACI is ideal for lightweight, stateless workloads.  
- DNS labels provide quick public access.  
- Logs and exec commands simplify 