# Application Security Groups (ASGs)

## What are ASGs?
Application Security Groups are logical groupings of virtual machines (NICs) that simplify network security rule management. Instead of defining rules based on IP addresses or subnets, you can define rules based on application roles (e.g., “web servers”, “database servers”).

## Why Use ASGs?
- **Simplify NSG rules**: No need to update rules when VMs are added, removed, or when their IP addresses change.
- **Dynamic membership**: Assign a NIC to an ASG, and all NSG rules referencing that ASG automatically apply.
- **Reduce errors**: Avoid misconfigured IP ranges; the ASG automatically includes all member VMs.
- **Operational agility**: Adding a new VM to a tier is as simple as adding its NIC to the appropriate ASG—no rule changes.

## How ASGs Work with NSGs
1. Create an ASG in the desired region.
2. Associate one or more NICs (specifically, their IP configurations) with the ASG.
3. In an NSG rule, set `--source-asgs` or `--destination-asgs` instead of `--source-address-prefixes`.
4. The rule is applied to all VMs whose NICs belong to the referenced ASG(s).

## Our Implementation
- Created two ASGs: `asg-web-servers` and `asg-app-servers`.
- Assigned web VMs to `asg-web-servers` and app VMs to `asg-app-servers`.
- Created an NSG rule that allows HTTP traffic from any member of `asg-app-servers` to any member of `asg-web-servers`.
- Added a new VM (`vm-app3`) to `asg-app-servers` – it immediately gained the ability to reach the web servers, without any NSG update.

## Limitations
- ASGs are regional resources; they can only group VMs from the same region.
- A NIC can be associated with up to 10 ASGs (default limit, can be increased).
- ASGs work only within the same VNet; cross‑VNet scenarios require other solutions (peering + NSG).

## Screenshots

---
![alt text](<Screenshot 2026-07-26 164316.png>)
---
![alt text](<Screenshot 2026-07-26 164330.png>)
---
![alt text](<Screenshot 2026-07-26 164416.png>)
---
![alt text](<Screenshot 2026-07-26 164632.png>)
---
![alt text](<Screenshot 2026-07-26 164637.png>)
---
![alt text](<Screenshot 2026-07-26 165554.png>)
---
![alt text](<Screenshot 2026-07-26 165907.png>)
---
![alt text](<Screenshot 2026-07-26 170016.png>)
---
![alt text](<Screenshot 2026-07-26 171108.png>)
---
![alt text](<Screenshot 2026-07-26 171120.png>)
---
![alt text](<Screenshot 2026-07-26 171158.png>)
---
![alt text](<Screenshot 2026-07-26 171237.png>)
---
![alt text](<Screenshot 2026-07-26 171521.png>)
---
![alt text](<Screenshot 2026-07-26 171530.png>)
---
![alt text](<Screenshot 2026-07-26 171813.png>)
---
![alt text](<Screenshot 2026-07-26 171823.png>)
---
![alt text](<Screenshot 2026-07-26 171828.png>)
---
![alt text](<Screenshot 2026-07-26 172131.png>)
---
![alt text](<Screenshot 2026-07-26 172531.png>)
---

## Lessons Learned
- ASGs simplify NSG maintenance by removing IP dependency.  
- Adding new VMs to ASGs automatically applies rules.  
- ASGs improve scalability in dynamic environments. 