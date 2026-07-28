# Private Endpoints for Azure PaaS Services

## Architecture
A private endpoint is a network interface in your VNet that connects you privately and securely to a service powered by Azure Private Link. The service could be Azure Storage, Azure SQL, or your own service behind a Private Link service.

## How It Works
1. Create a private endpoint in a subnet, pointing to the target resource (e.g., storage blob).
2. Azure provisions a NIC with a private IP from that subnet.
3. A private DNS zone (e.g., `privatelink.blob.core.windows.net`) is linked to the VNet. An A record maps the resource’s FQDN to the private IP.
4. When a VM in the linked VNet resolves the FQDN, it gets the private IP, and traffic never leaves the VNet.
5. The service’s public endpoint can be disabled, making it unreachable from the internet.

## Benefits
- **No internet exposure**: The service has no public endpoint.
- **Simple DNS**: Use the same FQDN for private and public access; DNS handles the difference.
- **Granular access**: Each private endpoint connects to a specific sub‑resource (blob, file, queue, etc.).
- **Cross‑VNet and on‑premises**: With proper networking (peering, VPN, ExpressRoute), you can access the private endpoint from anywhere in your private network.

## Our Implementation
- Created a storage account and a private endpoint for its Blob service.
- Integrated with the `privatelink.blob.core.windows.net` DNS zone.
- Deployed a test VM in the same VNet; DNS resolved to the private IP, and blob access worked after public access was disabled.
- External tests confirmed total isolation.

## Screenshots

---
![alt text](<Screenshot 2026-07-28 160352.png>)
---
![alt text](<Screenshot 2026-07-28 160359.png>)
---
![alt text](<Screenshot 2026-07-28 160410.png>)
---
![alt text](<Screenshot 2026-07-28 160507.png>)
---
![alt text](<Screenshot 2026-07-28 160805.png>)
---
![alt text](<Screenshot 2026-07-28 162431.png>)
---
![alt text](<Screenshot 2026-07-28 162446.png>)
---
![alt text](<Screenshot 2026-07-28 162515.png>)
---
![alt text](<Screenshot 2026-07-28 162649.png>)
---
![alt text](<Screenshot 2026-07-28 163954.png>)
---
![alt text](<Screenshot 2026-07-28 164045.png>)
---
![alt text](<Screenshot 2026-07-28 164103.png>)
---
![alt text](<Screenshot 2026-07-28 164251.png>)
---
![alt text](<Screenshot 2026-07-28 164304.png>)
---
![alt text](<Screenshot 2026-07-28 164325.png>)
---
![alt text](<Screenshot 2026-07-28 164335.png>)
---

## Lessons Learned
- Private endpoints enforce strict network isolation.  
- DNS integration is critical for resolution to private IPs.  
- Disabling public access ensures traffic flows only through private endpoint. 