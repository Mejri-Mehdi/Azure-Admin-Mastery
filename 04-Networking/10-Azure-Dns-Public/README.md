# Azure DNS (Public)

## What is Azure DNS?
Azure DNS is a hosting service for DNS domains, providing name resolution using Microsoft Azure’s global infrastructure. It supports all common DNS record types and can host both public and private zones.

## Azure DNS vs. Registrar DNS
- **Registrar DNS** (e.g., GoDaddy, Namecheap) typically provides basic DNS hosting when you buy a domain. It often lacks advanced features and may not be as reliable as a dedicated DNS service.
- **Azure DNS** is a standalone authoritative DNS service. You can buy a domain anywhere and delegate it to Azure DNS by updating the NS records at your registrar.
- With Azure DNS, you get:
  - Role‑based access control (RBAC)
  - Activity logs
  - Resource Manager integration (template deployments)
  - Alias records that automatically update when Azure resources change (e.g., public IPs)

## Alias Records
Alias records are Azure‑specific extensions to standard DNS. Instead of manually updating an A/AAAA record when an IP changes, you point the alias to the Azure resource itself. Azure DNS automatically keeps the DNS record in sync. This is critical for services like Application Gateway, Cloud Services, and Traffic Manager.

## Our Lab
- Created a public DNS zone `myappdomain2026.xyz`.
- Added A, alias A, CNAME, and TXT records.
- Tested resolution by querying the Azure name servers directly (no domain delegation required for testing).
- Demonstrated that alias records resolve to the same IP as the resource they reference.

## When Would You Use This?
- Hosting production DNS for your company’s website.
- Building multi‑region applications with Traffic Manager.
- Automating DNS updates via alias records to avoid manual changes.

## Screenshots

---
![alt text](<Screenshot 2026-07-27 211008.png>)
---
![alt text](<Screenshot 2026-07-27 211019.png>)
---
![alt text](<Screenshot 2026-07-27 211723.png>)
---
![alt text](<Screenshot 2026-07-27 212006.png>)
---
![alt text](<Screenshot 2026-07-27 212243.png>)
---
![alt text](<Screenshot 2026-07-27 212409.png>)
---
![alt text](<Screenshot 2026-07-27 212524.png>)
---
![alt text](<Screenshot 2026-07-27 213518.png>)
---
![alt text](<Screenshot 2026-07-27 214013.png>)
---
![alt text](<Screenshot 2026-07-27 213744.png>)
---

## Lessons Learned
- Azure DNS provides flexibility and integration with Azure resources.  
- Alias records simplify management by auto-updating.  
- TTL tuning affects propagation and caching.  