# VM Resize and Move

## Resizing a Virtual Machine
- Resizing allows you to scale the VM up or down based on workload.
- You must **stop (deallocate)** the VM before resizing to a new size that is not available on the same hardware cluster.
- Resizing retains all disk configurations, network settings, and extensions.
- Always verify that the target size is available in your region (`az vm list-skus`).

## Moving a VM Between Resource Groups
- Azure supports moving a VM and its **dependent resources** (NIC, OS/data disks, public IP, NSG) to another resource group in the same region.
- The move operation is idempotent and validates dependencies.
- Resources must be in the **same region**; cross‑region move is not supported via resource group move.
- Some resources like a public IP can be moved only if it’s **not associated** with a load balancer or other services.

## Cross‑Region Migration
- Use **Azure Resource Mover** to migrate multiple resources between regions with minimal downtime.
- Manual approach: snapshot → copy → new disk → new VM.
- Azure Site Recovery can also replicate and failover to a target region, which can be used for migration.

## Resources That Can / Cannot Be Moved

| Resource | Move to Another RG (same region) | Move to Another Region | Notes |
|----------|----------------------------------|------------------------|-------|
| VM (managed disks) | Yes | No (use Resource Mover) | Must move NIC and disk together |
| NIC | Yes (with VM) | No | Can be moved separately only if not attached to a VM |
| Public IP | Yes | No | Cannot be moved if associated with a running VM |
| Managed Disk | Yes | No | Can be moved independently |
| Availability Set | Yes (if empty) | No | VMs in the set cannot move without moving the set |
| Virtual Network | Yes | No | All subnets move together |
| Storage Account | No | Yes (using Azure Resource Mover) | Classic accounts have restrictions |

## Best Practices
- Before moving, **stop/deallocate** the VM to ensure data consistency.
- Note that moving a resource changes its **resource ID**, which can break dependent automation scripts or references.
- Use `az resource list` with tags to identify all related resources before a move.

## Screenshots

---
![alt text](<Screenshot 2026-07-23 214114.png>)
---
![alt text](<Screenshot 2026-07-23 214230.png>)
---
![alt text](<Screenshot 2026-07-23 214438.png>) 
---
![alt text](<Screenshot 2026-07-23 214704.png>)
---
![alt text](<Screenshot 2026-07-23 215733.png>)
---

## Lessons Learned
- VM resizing requires downtime.  
- Resource group moves are straightforward.  
- Region moves are complex and require planning.  