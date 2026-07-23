# VM Disks and Encryption

## Managed vs Unmanaged Disks
- **Managed disks** (current standard): Azure handles the storage account and ensures high availability. You just specify the disk type, size, and redundancy.
- **Unmanaged disks** (legacy): You manually create and manage VHDs inside your own storage accounts, dealing with IOPS limits and scalability.

All modern deployments use managed disks. This lab exclusively uses managed disks.

## Azure Disk Encryption (ADE) vs Encryption at Host vs SSE
| Method | What it Encrypts | Key Management |
|--------|------------------|----------------|
| **Storage Service Encryption (SSE)** | Data at rest in Azure Storage (always on) | Microsoft‑managed keys or customer‑managed keys (CMK) |
| **Azure Disk Encryption (ADE)** | OS and data disks inside the VM (volume‑level) | BitLocker/DM‑Crypt using your keys in Key Vault |
| **Encryption at Host** | VM temporary disk and caches on the host | Platform‑managed keys; data is encrypted before it reaches the host |

ADE adds an extra layer of protection: even if a VHD is leaked, the volume is useless without the Key Vault key.

## Disk Snapshots
- Point‑in‑time, read‑only copy of a managed disk.
- Can be used to create new managed disks (OS or data) for recovery, cloning, or backup validation.
- Snapshots are billed for used size, not provisioned size.
- Can be incremental (Premium SSD v2/Ultra not yet supported for incremental snapshots; Standard SSD/Premium SSD support incremental snapshots).

## Our Lab Execution
1. Created a Windows VM with managed OS disk (Standard SSD).
2. Attached a Premium SSD data disk, initialized in Windows.
3. Configured Key Vault with proper access for Azure Disk Encryption.
4. Enabled ADE on both OS and data disks; verified they are encrypted.
5. Took a snapshot of the OS disk and created a new managed disk from it.
6. Attached that new disk to a second VM, demonstrating snapshot‑based recovery.

## Screenshot

---
![alt text](<Screenshot 2026-07-23 211435.png>)
---

## Lessons Learned
- Premium SSDs provide predictable performance for production workloads.  
- ADE ensures compliance and security for sensitive data.  
- Snapshots enable quick recovery and cloning of disks.  