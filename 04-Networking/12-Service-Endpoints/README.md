# Service Endpoints for Azure Storage

## What Are Service Endpoints?
Service endpoints extend your VNet’s identity to Azure services over the Azure backbone. They allow you to secure critical service resources (like storage accounts) to only your virtual network. Traffic uses the Azure backbone, providing optimal routing and security without requiring a private IP.

## How They Work
- You enable a service endpoint on a subnet for a specific service (e.g., `Microsoft.Storage`).
- The Azure platform adds a route so that traffic to that service from the subnet goes directly over the Azure backbone.
- On the service side (storage account), you configure firewall rules that accept traffic from that VNet/subnet.
- The storage account still has a public IP; traffic does **not** become private. However, the source IP seen by the service is the private IP of the VM (or a VNet‑specific IP), allowing the firewall rule to match.

## Service Endpoint vs. Private Endpoint
| Feature | Service Endpoint | Private Endpoint |
|---------|------------------|------------------|
| **IP address** | Storage keeps its public IP | Storage gets a private IP in your VNet |
| **Traffic path** | Azure backbone, but still to public endpoint | Fully private, stays within VNet and Azure backbone |
| **Security** | Firewall rules based on VNet identity | Complete isolation from the internet |
| **Cost** | Free | Paid (per endpoint) |
| **Use case** | Simple network restriction; no need for private IP | Highest security, compliance, or when you must eliminate public endpoints |

## Our Implementation
- Enabled `Microsoft.Storage` service endpoint on subnet `snet-app`.
- Created a storage account and locked its firewall to only allow `snet-app`.
- Deployed a test VM in the subnet; it could access the storage.
- Confirmed that our local machine (outside the VNet) was blocked.

## Best Practices
- Use service endpoints to reduce exposure of PaaS services to the internet.
- Combine with storage firewall “Deny” default action for defense in depth.
- For complete private connectivity, use Private Endpoints.

## Screenshots

---
![alt text](<Screenshot 2026-07-28 121231.png>)
---
![alt text](<Screenshot 2026-07-28 121400.png>)
---
![alt text](<Screenshot 2026-07-28 121523.png>)
---
![alt text](<Screenshot 2026-07-28 121615.png>)
---
![alt text](<Screenshot 2026-07-28 121748.png>)
---
![alt text](<Screenshot 2026-07-28 122656.png>)
---
![alt text](<Screenshot 2026-07-28 122950.png>)
---
![alt text](<Screenshot 2026-07-28 123020.png>)
---
![alt text](<Screenshot 2026-07-28 141937.png>)
---
![alt text](<Screenshot 2026-07-28 141942.png>)
---
![alt text](<Screenshot 2026-07-28 142209.png>)
---
![alt text](<Screenshot 2026-07-28 142242.png>)
---
![alt text](<Screenshot 2026-07-28 142249.png>)
---
![alt text](<Screenshot 2026-07-28 142259.png>)
---

## Lessons Learned
- Service endpoints improve security by restricting access to VNets.  
- Traffic optimization via Azure backbone reduces latency.  
- Still relies on public IP; not fully private.