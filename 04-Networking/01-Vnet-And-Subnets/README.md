# VNet and Subnet Design for a 3‑Tier Application

## Subnet Sizing Best Practices
- **Tier separation**: Use different subnets for web, application, and database layers to isolate security boundaries and apply NSG rules per tier.
- **Size for growth**: Reserve enough IP space for future scale‑out. In our design, each /24 subnet provides 251 IPs, enough for many VMs.
- **Reserved IPs**: Azure reserves the first three usable IPs and the last IP of every subnet. Always subtract 5 from the total to get the number of available host addresses.
- **AzureBastionSubnet**: This special subnet must be named exactly `AzureBastionSubnet` and have a minimum size of /26. It hosts the Bastion host instances used for secure RDP/SSH without public IPs on VMs.

## How We Built It
- Created a VNet `vnet-prod-eus-001` with address space 10.0.0.0/16.
- Carved out four subnets:
  - `snet-web` (10.0.1.0/24) for the presentation tier.
  - `snet-app` (10.0.2.0/24) for the business logic tier.
  - `snet-db` (10.0.3.0/24) for the database tier.
  - `AzureBastionSubnet` (10.0.4.0/26) for future Bastion deployment.
- Deployed a small Ubuntu VM in each application subnet.
- Added an NSG rule allowing ICMP (ping) within the VNet, then tested connectivity between subnets.

## Connectivity Tests
- From `vm-web` (10.0.1.x), pinged `vm-app` (10.0.2.x) and `vm-db` (10.0.3.x) successfully.
- This confirms that by default, all subnets within a VNet can communicate with each other (unless blocked by NSGs).

## Key Takeaways
- Careful subnet sizing prevents IP exhaustion and allows secure tier separation.
- Always account for Azure’s 5 reserved IPs when calculating usable addresses.
- Use NSGs to restrict traffic between tiers (e.g., only allow web‑to‑app, not app‑to‑db directly from the internet).
- The `AzureBastionSubnet` is a prerequisite for deploying Azure Bastion, which provides secure, agentless RDP/SSH.

## Screenshots

---
![alt text](<Screenshot 2026-07-25 204623.png>)
---
![alt text](<Screenshot 2026-07-25 204633.png>)
---
![alt text](<Screenshot 2026-07-25 204912.png>)
---
![alt text](<Screenshot 2026-07-25 205438.png>)
---
![alt text](<Screenshot 2026-07-25 205442.png>)
---
![alt text](<Screenshot 2026-07-25 205952.png>)
---
![alt text](<Screenshot 2026-07-25 210033.png>)
---
![alt text](<Screenshot 2026-07-25 212415.png>)
---
![alt text](<Screenshot 2026-07-25 212502.png>)
---
![alt text](<Screenshot 2026-07-25 212507.png>)
---
![alt text](<Screenshot 2026-07-25 212700.png>)
---
![alt text](<Screenshot 2026-07-25 213810.png>)
---

## Lessons Learned
- Proper subnet sizing ensures scalability.  
- Reserved IPs reduce usable addresses slightly.  
- Bastion requires special subnet naming and sizing.  