# Storage Firewalls, VNet Rules, and Private Endpoints

Azure Storage supports three network isolation mechanisms:

## 1. Storage Firewall / IP Whitelist
- Restrict access to specific public IP addresses or CIDR ranges.
- Useful for locking down access to known office IPs or developer machines.
- Only works for traffic coming from the allowed IPs; cannot differentiate between users.

## 2. VNet Service Endpoints
- Enables a subnet to connect to Azure Storage using the Azure backbone (no internet).
- The subnet must have the **Microsoft.Storage** service endpoint enabled.
- After adding the subnet in the storage firewall, all traffic from that subnet is trusted.
- Does **not** give the storage account a private IP; traffic still uses the public endpoint, but source is VNet.

## 3. Private Endpoints (Preview in this project, full in later lab)
- Provides a **private IP** in your VNet for the storage account.
- Traffic never traverses the public internet; it stays entirely within your VNet and the Microsoft backbone.
- Most secure option; can completely disable public access.

## When to Use What
- **IP rules**: for individual developer access or hybrid connectivity where you have a fixed public IP.
- **VNet service endpoints**: for allowing an entire Azure subnet to access storage without exposing it to internet.
- **Private endpoints**: for scenarios requiring maximum security, when you can't allow any public endpoint exposure.

## Key Takeaway
The storage firewall allows you to build a layered defense: first restrict network access (firewall + VNet rules), then use Azure AD / SAS for identity‑based control.

## Screenshots

---
![alt text](<Screenshot 2026-07-18 171855.png>)
---
![alt text](<Screenshot 2026-07-18 171936.png>)
---

## Lessons Learned
- Firewalls and VNet rules enforce least privilege access.  
- IP rules support both IPv4 and IPv6.  
- Private endpoints provide the most secure option by eliminating public exposure.  