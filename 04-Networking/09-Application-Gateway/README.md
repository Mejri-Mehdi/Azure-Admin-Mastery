# Azure Application Gateway – Layer 7 Load Balancing

## Application Gateway vs. Load Balancer
| Feature | Load Balancer (Layer 4) | Application Gateway (Layer 7) |
|---------|--------------------------|--------------------------------|
| **OSI Layer** | Transport (TCP/UDP) | Application (HTTP/HTTPS) |
| **Routing** | Based on 5‑tuple hash (IP/port) | URL path, host headers, query strings |
| **SSL Termination** | Not supported (passthrough) | Supported (offloads SSL) |
| **Web Application Firewall** | No | Yes (WAF SKU) |
| **Cookie‑based affinity** | Not possible | Yes (sticky sessions) |
| **Connection draining** | Not available | Yes |

## Why Use Application Gateway?
- **Path‑based routing**: Route `/images` to one set of servers and `/api` to another.
- **Multi‑site hosting**: Host multiple domains on the same gateway.
- **WAF**: Protect against OWASP Top 10 attacks (SQL injection, XSS, etc.).
- **SSL offloading**: Terminate HTTPS at the gateway, reducing backend burden.

## Our Implementation
- Created a dedicated subnet for the Application Gateway (`snet-appgw`).
- Deployed two Ubuntu VMs acting as separate microservices (images server and API server).
- Configured path‑based rules: `/images/*` → vm-images, `/api/*` → vm-api, default → vm-images.
- Enabled WAF v2 in **Detection** mode to log malicious requests without blocking.
- Tested normal traffic and a simulated SQL injection query, confirming WAF detection.

## Key Considerations
- The Application Gateway subnet must be dedicated; no other resources (like VMs) can be placed in it.
- It requires a /24 or larger subnet to scale.
- Backend VMs must allow inbound HTTP from the Application Gateway subnet (NSG rule).
- WAF can be switched to **Prevention** mode to actively block attacks.

## Screenshots

---
![alt text](<Screenshot 2026-07-27 174645.png>)
---
![alt text](<Screenshot 2026-07-27 174650.png>)
---
![alt text](<Screenshot 2026-07-27 174650-1.png>)
---
![alt text](<Screenshot 2026-07-27 180813.png>)
---
![alt text](<Screenshot 2026-07-27 180919.png>)
---
![alt text](<Screenshot 2026-07-27 184303.png>)
---
![alt text](<Screenshot 2026-07-27 184310.png>)
---
![alt text](<Screenshot 2026-07-27 184314.png>)
---
![alt text](<Screenshot 2026-07-27 184800.png>)
---
![alt text](<Screenshot 2026-07-27 185430.png>)
---
![alt text](<Screenshot 2026-07-27 191429.png>)
---
![alt text](<Screenshot 2026-07-27 191445.png>)
---
![alt text](<Screenshot 2026-07-27 193353.png>)
---
![alt text](<Screenshot 2026-07-27 193411.png>)
---
![alt text](<Screenshot 2026-07-27 193536.png>)
---
![alt text](<Screenshot 2026-07-27 193543.png>)
---
![alt text](<Screenshot 2026-07-27 193549.png>)
---
![alt text](<Screenshot 2026-07-27 201303.png>)
---
![alt text](<Screenshot 2026-07-27 201326.png>)
---
![alt text](<Screenshot 2026-07-27 201723.png>)
---
![alt text](<Screenshot 2026-07-27 201729.png>)
---
![alt text](<Screenshot 2026-07-27 201802.png>)
---
![alt text](<Screenshot 2026-07-27 201816.png>)
---

## Lessons Learned
- Application Gateway adds Layer 7 intelligence beyond Load Balancer.  
- WAF provides critical security visibility.  
- Path-based routing simplifies multi-service 