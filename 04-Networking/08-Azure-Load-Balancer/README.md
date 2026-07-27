# Azure Load Balancer – Layer 4

## Layer 4 vs. Layer 7
- **Layer 4 (transport)**: Azure Load Balancer works at TCP/UDP level. It distributes traffic based on 5‑tuple hash (source IP, source port, destination IP, destination port, protocol). It does **not** inspect HTTP headers or URL paths.
- **Layer 7 (application)**: Application Gateway or Azure Front Door can route based on URL, host headers, SSL termination, and more.

## Public vs. Internal Load Balancer
- **Public LB**: Has a public frontend IP and distributes inbound internet traffic to backend VMs (which often have only private IPs).
- **Internal LB**: Has a private frontend IP, used to load‑balance traffic between services inside a VNet (e.g., between web tier and app tier).

## Key Features of Standard SKU
- Zone‑redundant or zonal frontend.
- High Availability (HA) ports: load balance any port on a single rule.
- Must have explicit NSG rules for inbound traffic (if using public IP).
- Supports larger backend pools and faster health probes.

## Our Implementation
1. Created two Windows VMs in an availability set, each with IIS installed.
2. Deployed a **public Standard load balancer** with a TCP health probe on port 80.
3. Verified traffic alternates between VMs.
4. Stopped IIS on one VM; health probe detected failure and traffic shifted to the healthy VM.
5. Deployed an **internal load balancer** with a private frontend IP (`10.20.1.100`) to demonstrate internal load balancing.

## Screenshots

---
![alt text](<Screenshot 2026-07-27 114547.png>)
---
![alt text](<Screenshot 2026-07-27 114610.png>)
---
![alt text](<Screenshot 2026-07-27 114713.png>)
---
![alt text](<Screenshot 2026-07-27 115051.png>)
---
![alt text](<Screenshot 2026-07-27 115127.png>)
---
![alt text](<Screenshot 2026-07-27 121539.png>)
---
![alt text](<Screenshot 2026-07-27 121758.png>)
---
![alt text](<Screenshot 2026-07-27 122903.png>)
---
![alt text](<Screenshot 2026-07-27 131910.png>)
---
![alt text](<Screenshot 2026-07-27 132436.png>)
---
![alt text](<Screenshot 2026-07-27 132516.png>)
---
![alt text](<Screenshot 2026-07-27 132645.png>)
---
![alt text](<Screenshot 2026-07-27 132816.png>)
---
![alt text](<Screenshot 2026-07-27 133313.png>)
---
![alt text](<Screenshot 2026-07-27 133350.png>)
---
![alt text](<Screenshot 2026-07-27 133406.png>)
---

## Lessons Learned
- Health probes are critical for high availability.  
- Standard SKU provides better resiliency and features.  
- Layer 7 features (URL routing, SSL termination) require Application Gateway.  