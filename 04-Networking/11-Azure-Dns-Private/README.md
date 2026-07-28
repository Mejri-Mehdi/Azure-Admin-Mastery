# Azure Private DNS

## Private vs. Public DNS
- **Public DNS**: Resolves names from anywhere on the internet. Used for websites, public APIs.
- **Private DNS**: Resolves names only within linked Azure VNets. Used for internal service discovery, database connections, microservices communication.

## Key Features of Azure Private DNS
- **Automatic registration**: VMs in VNets with auto‑registration enabled automatically get A records created and updated when their private IP changes.
- **Manual records**: You can create A, CNAME, TXT, etc., for resources that don’t support auto‑registration (e.g., internal load balancers, on‑prem servers via forwarders).
- **Cross‑VNet resolution**: Link multiple VNets to the same private zone. Records are resolvable from all linked VNets.
- **No public endpoint**: The zone is hosted on Azure’s internal DNS servers; it cannot be queried from the internet.

## Why Use Private DNS?
- Replace custom DNS servers running on VMs.
- Simplify service discovery: a web server can find its database at `db.internal.contoso.com` regardless of IP changes.
- Integrate with Azure Policy to enforce private zone usage.

## Our Lab
- Created a private zone `internal.contoso.com`.
- Linked it to two VNets: one with auto‑registration, one without.
- Deployed a VM in the first VNet; its A record was automatically created.
- Added a manual `db` record.
- Successfully resolved all records from VMs in both VNets.

## Screenshots

---
![alt text](<Screenshot 2026-07-28 111851.png>)
---
![alt text](<Screenshot 2026-07-28 112014.png>)
---
![alt text](<Screenshot 2026-07-28 112113.png>)
---
![alt text](<Screenshot 2026-07-28 112130.png>)
---
![alt text](<Screenshot 2026-07-28 112259.png>)
---
![alt text](<Screenshot 2026-07-28 112359.png>)
---
![alt text](<Screenshot 2026-07-28 112507.png>)
---
![alt text](<Screenshot 2026-07-28 112654.png>)
---
![alt text](<Screenshot 2026-07-28 112807.png>)
---
![alt text](<Screenshot 2026-07-28 112921.png>)
---
![alt text](<Screenshot 2026-07-28 112955.png>)
---
![alt text](<Screenshot 2026-07-28 113312.png>)
---
![alt text](<Screenshot 2026-07-28 113537.png>)
---
![alt text](<Screenshot 2026-07-28 113729.png>)
---
![alt text](<Screenshot 2026-07-28 113813.png>)
---
![alt text](<Screenshot 2026-07-28 114710.png>)
---

## Lessons Learned
- Private DNS simplifies internal name resolution.  
- Auto-registration reduces manual record management.  
- Linking multiple VNets enables shared resolution.  