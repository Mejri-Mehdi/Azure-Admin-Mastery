# VM Backup and Restore Workflow

## Restore Types Explained
Azure Backup supports three restore methods for virtual machines:

1. **Create New VM**
   - Creates a brand‑new virtual machine from the selected recovery point.
   - Most common method when the original VM is lost or you need a copy.
   - Preserves OS disk, data disks, and most networking settings (you can adjust during restore).

2. **Restore Disks**
   - Restores only the VHD files (OS and data disks) into a specified storage account.
   - You then manually create a new VM and attach the disks.
   - Useful when you need to change the VM size, region, availability set, or virtual network.

3. **Replace Existing**
   - Overwrites the OS disk (and optionally data disks) of the original source VM.
   - The original VM must be stopped before the operation.
   - Used for in‑place recovery, e.g., after a ransomware attack or critical system file corruption.

## File‑Level Recovery
- Provides instant access to files within a backup snapshot without restoring the entire VM.
- Mounts the backup as a local drive (Windows) or via iSCSI (Linux).
- Best for quick retrieval of specific files or folders.

## Our Demonstration
- Listed available recovery points.
- Performed a file‑level recovery on `vm-win-bk`, successfully extracting a web page.
- Restored a full VM (`vm-restored`) from the same backup and verified its functionality.
- Documented all three restore options with use cases.

## Best Practices
- **Test restores regularly** to validate backup integrity.
- Use **file‑level recovery** for daily operational recoveries.
- For disaster recovery, pre‑plan the “Create New VM” option with scripts or templates.
- Ensure the vault’s **soft delete** and **cross‑region restore** settings align with your RPO/RTO.

## Screenshots

---
![alt text](<Screenshot 2026-07-31 195556.png>)
---
![alt text](<Screenshot 2026-07-31 195704.png>)
---
![alt text](<Screenshot 2026-07-31 195731.png>)
---
![alt text](<Screenshot 2026-07-31 200132.png>)
---
![alt text](<Screenshot 2026-07-31 200136.png>)
---
![alt text](<Screenshot 2026-07-31 200214.png>)
---
![alt text](<Screenshot 2026-07-31 200230.png>)
---
![alt text](<Screenshot 2026-07-31 200426.png>)
---
![alt text](<Screenshot 2026-07-31 200514.png>)
---
![alt text](<Screenshot 2026-07-31 200542.png>)
---
![alt text](<Screenshot 2026-07-31 200832.png>)
---
![alt text](<Screenshot 2026-07-31 200919.png>)
---
![alt text](<Screenshot 2026-07-31 201041.png>)
---
![alt text](<Screenshot 2026-07-31 201102.png>)
---
![alt text](<Screenshot 2026-07-31 201119.png>)
---
![alt text](<Screenshot 2026-07-31 201245.png>)
---
![alt text](<Screenshot 2026-07-31 201528.png>)
---
![alt text](<Screenshot 2026-07-31 201842.png>)
---
![alt text](<Screenshot 2026-07-31 201957.png>)
---
![alt text](<Screenshot 2026-07-31 202317.png>)
---
![alt text](<Screenshot 2026-07-31 202339.png>)
---
![alt text](<Screenshot 2026-07-31 202358.png>)
---
![alt text](<Screenshot 2026-07-31 203333.png>)
---
![alt text](<Screenshot 2026-07-31 204058.png>)
---
![alt text](<Screenshot 2026-07-31 210338.png>)
---
![alt text](<Screenshot 2026-07-31 210639.png>)
---
![alt text](<Screenshot 2026-07-31 211752.png>)
---
![alt text](<Screenshot 2026-07-31 212133.png>)
---

## Lessons Learned
- Recovery Services Vault supports granular and full VM recovery.  
- File-level recovery is ideal for small data needs.  
- VM restore ensures business continuity. 