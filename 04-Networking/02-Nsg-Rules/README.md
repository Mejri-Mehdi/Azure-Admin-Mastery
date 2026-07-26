# Network Security Groups (NSG) Rules

## How NSG Rules Work
- **Priority**: Rules are evaluated in order from lowest number (highest priority) to highest number. The first rule that matches the traffic (source IP, destination IP, protocol, port) is applied, and no further rules are evaluated.
- **Implicit Deny**: After all user‑defined rules, there is a built‑in rule `DenyAllInBound` (priority 65500) that blocks all inbound traffic that hasn't been explicitly allowed.
- **Default Rules**: Each NSG includes a set of default rules (e.g., `AllowVnetInBound`, `AllowAzureLoadBalancerInBound`) that cannot be removed but can be overridden with higher‑priority custom rules.

## Our NSG Configuration

### nsg-web (attached to `snet-web`)
| Priority | Name               | Source          | Destination | Port        | Action |
|----------|--------------------|-----------------|-------------|-------------|--------|
| 100      | AllowHTTP          | Internet        | *           | 80          | Allow  |
| 110      | AllowHTTPS         | Internet        | *           | 443         | Allow  |
| 120      | AllowSSHfromApp    | 10.0.2.0/24     | *           | 22          | Allow  |
| 130      | DenyInternetInbound| Internet        | *           | *           | Deny   |
| 4000     | AllowRDP           | <your‑public‑IP>| *           | 3389        | Allow  |

### nsg-db (attached to `snet-db`)
| Priority | Name               | Source          | Destination | Port        | Action |
|----------|--------------------|-----------------|-------------|-------------|--------|
| 100      | AllowSQLfromApp    | 10.0.2.0/24     | *           | 1433        | Allow  |
| 110      | DenyWebInbound     | 10.0.1.0/24     | *           | *           | Deny   |

## How We Tested
- **Web traffic**: Allowed from Internet on ports 80/443, blocked for other internal subnets (unless explicitly opened).
- **SSH to web VMs**: Allowed only from the app subnet, improving security posture.
- **Database access**: Allowed only from the app subnet; all traffic from the web subnet is explicitly blocked.
- **RDP for admin**: Allowed from a specific public IP (your machine) for emergency access.

## Key Takeaways
- NSGs are stateful; if you allow an inbound request, the response is automatically allowed outbound.
- Rules can use service tags (like `Internet`, `VirtualNetwork`) or specific IP addresses/subnets.
- When troubleshooting connectivity, always check **Effective security rules** on the VM's NIC – it shows the merged set of rules from all applied NSGs.

## Screenshots

---
![alt text](<Screenshot 2026-07-26 135432.png>)
---
![alt text](<Screenshot 2026-07-26 135452.png>)
---
![alt text](<Screenshot 2026-07-26 140031.png>)
---
![alt text](<Screenshot 2026-07-26 140052.png>)
---
![alt text](<Screenshot 2026-07-26 141308.png>)
---
![alt text](<Screenshot 2026-07-26 141340.png>)
---
![alt text](<Screenshot 2026-07-26 141735.png>)
---
![alt text](<Screenshot 2026-07-26 142417.png>)
---
![alt text](<Screenshot 2026-07-26 142428.png>)
---
![alt text](<Screenshot 2026-07-26 143550.png>)
---
![alt text](<Screenshot 2026-07-26 143731.png>)
---
![alt text](<Screenshot 2026-07-26 145429.png>)
---

## Lessons Learned
- NSG priorities are critical; lower numbers override higher ones.  
- Effective rules combine subnet NSG + NIC NSG.  
- Testing connectivity validates rule behavior.  