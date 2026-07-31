# VM Backup Restore Procedure

## Prerequisites
- Recovery Services vault `rsv-backup` with protected VMs.
- At least one recovery point available.

## File‑Level Recovery (Windows VM)
1. In the portal, navigate to **Recovery Services vault** → **Backup items** → **Azure Virtual Machine** → select `vm-win-bk`.
2. Click **File Recovery**.
3. Select a recovery point and click **Download Executable**.
4. Run the downloaded `.exe` on a Windows machine. Accept security prompts.
5. The script mounts the backup disks as a local drive (e.g., `G:`).
6. Browse and copy required files.
7. Close the script window to unmount the disks.

## Full VM Restore (Create New VM)
1. On the backup item page, click **Restore VM**.
2. Choose a recovery point.
3. Select **Create new** as restore configuration.
4. Specify the new VM name, resource group, and network settings.
5. Click **Restore** and monitor the backup job.
6. After completion, verify the new VM is operational.

## Restore Options Summary
| Option | Use Case | Behavior |
|--------|----------|----------|
| **Create new VM** | Quick recovery with minimal changes | Creates a new VM with restored OS/data disks. |
| **Restore disks** | Custom VM creation or configuration change | Restores only the VHDs to a storage account; you create the VM manually. |
| **Replace existing** | In‑place recovery of a failed VM | Overwrites the existing VM’s disks. Original VM must be stopped. |