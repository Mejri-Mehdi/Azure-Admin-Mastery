# VM Deployment Choices Explained

## VM Size Selection
- **Standard_B2s** is a burstable VM ideal for low‑cost testing. It provides 2 vCPUs and 4 GiB RAM, with the ability to burst CPU performance when needed. This keeps the lab cost minimal while still demonstrating real workloads.

## Disk Type
- **Standard SSD** (E4 for Windows, 127 GiB; 30 GiB for Ubuntu). Standard SSDs offer consistent performance at a lower price than Premium SSDs, suitable for development and testing.

## Public IP SKU
- **Standard** SKU is zone‑redundant and supports secure access controls (Network Security Groups). The Basic SKU is deprecated for new deployments. We used Standard with dynamic allocation (static is also fine but costs more if the VM is deallocated).

## Availability Options
- We chose `No infrastructure redundancy required` for this lab. For production, you would use **Availability Zones** (if the region supports them) or **Availability Sets** to protect against datacenter/rack failures.

## Networking
- Both VMs reside in the same VNet and subnet, so they can communicate via private IP without going through the internet. The NSG rules were auto‑created to allow RDP/SSH from any source IP, but in a real environment you would restrict the source IP for security.

## Boot Diagnostics
- Enabled with **managed storage account**. This eliminates the need for a separate storage account and captures console screenshots and serial logs, helping troubleshoot boot issues.

## Identity
- No managed identity was assigned now; we’ll use it later when integrating with other Azure services.

This portal‑based deployment serves as the foundation for all subsequent compute labs

## Screenshots

---
![alt text](<Screenshot 2026-07-23 155141.png>)
---
![alt text](<Screenshot 2026-07-23 155256.png>)
---
![alt text](<Screenshot 2026-07-23 155440.png>)
---
![alt text](<Screenshot 2026-07-23 155451.png>)
---
![alt text](<Screenshot 2026-07-23 155807.png>)
---
![alt text](<Screenshot 2026-07-23 161353.png>)
---
![alt text](<Screenshot 2026-07-23 161713.png>)
---
![alt text](<Screenshot 2026-07-23 161727.png>)
---

## Lessons Learned
- Portal blades provide full control over VM configuration.  
- NSG rules are automatically created but should be hardened.  
- Boot diagnostics help troubleshoot startup issues.  