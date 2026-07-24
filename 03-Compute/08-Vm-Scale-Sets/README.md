# Virtual Machine Scale Sets (VMSS)

## What is a VMSS?
A Virtual Machine Scale Set (VMSS) is a group of identical, load‑balanced VMs that can automatically increase or decrease in number based on demand or a schedule.

## Uniform vs Flexible Orchestration
- **Uniform**: All VMs are identical, deployed from the same image and configuration. They share the same load balancer and are managed as a single entity. This is the traditional mode and the focus of AZ‑104.
- **Flexible**: Supports mixing different VM sizes, using Availability Zones or regional VMs, and giving each VM its own NIC/disk. Works more like individual VMs, but still managed as a group.

## VMSS vs Availability Sets
| Feature | VMSS | Availability Set |
|--------|------|------------------|
| **Scaling** | Automatic based on metrics | Manual; no built‑in autoscale |
| **Load balancing** | Integrated (Azure Load Balancer or Application Gateway) | Must be added separately |
| **Fault domains** | Can span zones (Flexible) or use a set number of FDs (Uniform) | Fixed number of FDs/UDs |
| **Use case** | Horizontal scaling for web apps, microservices | Static groups of VMs needing HA but not scaling |
| **SLA** | Depends on configuration (99.95% with 2+ instances, or higher with zones) | 99.95% (2+ VMs) |

## Autoscale Concepts
- **Metrics**: CPU, memory, disk, custom metrics.
- **Rules**: Scale out when metric exceeds threshold, scale in when below.
- **Cooldown**: Prevents rapid scaling up/down.
- **Overprovisioning**: For Uniform scale sets, Azure can deploy extra instances to speed up deployment.

## Our Lab
- Created a Uniform VMSS with 2 Ubuntu VMs.
- Used custom script extension to install nginx and stress.
- Configured autoscale to add/remove instances based on CPU (75% scale out, 25% scale in).
- Generated CPU load via SSH to one instance; watched the VMSS scale out.
- After load subsides, scale‑in reduces the count back to baseline.

## Screenshots

---
![alt text](<Screenshot 2026-07-24 133859.png>)
---
![alt text](<Screenshot 2026-07-24 135629.png>)
---
![alt text](<Screenshot 2026-07-24 140339.png>)
---
![alt text](<Screenshot 2026-07-24 140406.png>)
---



## Lessons Learned
- VMSS provides elasticity and high availability.  
- Autoscale ensures cost efficiency and performance.  
- Uniform orchestration simplifies management; Flexible adds versatility.  
