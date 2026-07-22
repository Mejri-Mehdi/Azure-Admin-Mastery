# Azure Files – Fully Managed SMB/NFS File Shares

## What is Azure Files?
Azure Files offers fully managed file shares in the cloud that can be accessed via the SMB (Server Message Block) or NFS protocol. They can be mounted concurrently by Windows, Linux, and macOS clients, on‑premises or in Azure.

## Common Use Cases
- **Lift‑and‑shift applications** that require file‑based storage (shared drives, config files).
- **Centralized file sharing** across multiple VMs or containers.
- **Hybrid environments** where on‑premises servers mount the same share via Azure File Sync or direct SMB.
- **Development and debugging** – easily share code or logs between team members.

## How Our Setup Works
1. Created a storage account (`filestgxyz123`) with a file share `shared-docs` (100 GiB quota).
2. Deployed Windows and Linux VMs in the same VNet.
3. Mounted the file share on both operating systems using the storage account key.
4. Tested read/write operations from both VMs, proving the share is consistent and concurrent.

## Mounting Details

### Windows
- Uses `net use` with the `Azure\<storageaccount>` username and the storage key.
- Can be persistent across reboots with `/persistent:yes`.

### Linux
- Uses `mount -t cifs` with a credentials file (`/etc/smbcredentials/`).
- Required packages: `cifs-utils`.
- Mount options like `nosharesock` and `actimeo` improve performance.

## Performance and Limits
- Standard storage accounts support up to 5 TiB per share (or 100 TiB with **large file shares** enabled).
- Premium file shares (SSD-backed) provide higher IOPS and lower latency.
- Throughput scales with the share size (baseline + additional MiB/s per TiB).
- Max 2000 concurrent connections per share (SMB).

## SMB 3.1.1 vs SMB 2.1
Azure Files defaults to **SMB 3.1.1**, which offers:
- **Encryption in transit** (mandatory, AES-256-GCM)
- **Secure dialect negotiation** (prevents downgrade attacks)
- **Pre-authentication integrity** (signing)
- **Multi‑channel** (multiple TCP connections for better throughput)

SMB 2.1 is available only if you explicitly set the storage account’s `minimumTlsVersion` or SMB settings to disable 3.0+. It lacks encryption in transit, making it unsuitable for production workloads. **Always use SMB 3.1.1** unless legacy clients require 2.1.

## Security Recommendations
- Use **Azure AD Kerberos** authentication (preview) for identity‑based access instead of storage account keys.
- Enable **Azure File Sync** for hybrid caching and centralized backup.
- Set share‑level access policies (RBAC) and use **Azure Policy** to enforce encryption.

## Our Tests
- Created `readme.txt` from the portal; both VMs could read it.
- Created a file from Windows; it appeared instantly on Linux.
- Deleted a file from Linux; it disappeared from Windows.
- This demonstrates true multi‑protocol, multi‑OS file sharing.

## Cleanup
```powershell
az group delete --name rg-file-share --yes
```

## Screenshots

---
![alt text](<Screenshot 2026-07-22 174612.png>)
---
![alt text](<Screenshot 2026-07-22 174637.png>)
---
![alt text](<Screenshot 2026-07-22 180431.png>)
---
![alt text](<Screenshot 2026-07-22 182204.png>)
---
![alt text](<Screenshot 2026-07-22 183311.png>)
---
![alt text](<Screenshot 2026-07-22 184256.png>)
---

## Lessons Learned
- Azure Files provides cross-platform file sharing.  
- SMB 3.1.1 is recommended for security and performance.  
- Large file shares enable scaling up to 100TB.  