# 02 – Storage: Azure Storage Services & Management

This section covers the full lifecycle of Azure Storage – from account types and redundancy to security, data transfer, and encryption. You built and tested real storage configurations across 14 hands‑on modules.

## Modules Overview

| Module | Folder | What You Built |
|--------|--------|----------------|
| **01 – Storage Account Types** | `01-storage-account-types/` | Created four accounts: Standard v2 LRS, Premium Block Blobs, Premium File Shares, Standard v2 GRS. Compared capabilities and tested failures (file share on BlockBlob, page blob on Standard). |
| **02 – Redundancy (LRS/ZRS/GRS/RA‑GRS/GZRS)** | `02-redundancy-lrs-zrs-grs/` | Deployed five accounts with different replication options, uploaded a blob to each, tested secondary read access on RA‑GRS, and documented SLAs and failover. |
| **03 – Storage Firewalls & VNet Rules** | `03-storage-firewalls-vnet-rules/` | Locked down a storage account to a specific VNet subnet and local IP, tested access from a VM and local machine, and observed denial after removing the IP rule. |
| **04 – Blob Storage Tiers** | `04-blob-storage-tiers/` | Uploaded blobs to Hot, Cool, and Archive tiers, tested Archive rehydration, and compared cost/latency/use cases. |
| **05 – Blob Lifecycle Management** | `05-blob-lifecycle-management/` | Defined an automated lifecycle policy that transitions blobs from Hot → Cool → Archive → Delete after 30/90/365 days, with a prefix filter. |
| **06 – Access Keys & Rotation** | `06-access-keys-rotation/` | Used access keys to upload a blob, rotated key1, observed that old key1 fails while key2 still works, then disabled shared key access entirely. |
| **07 – Shared Access Signatures (SAS)** | `07-shared-access-signatures/` | Created account SAS and service SAS with varying permissions and expiry, tested access and expiration, documented delegation best practices. |
| **08 – Azure CDN & Custom Domains** | `08-cdn-custom-domains/` | Deployed a CDN endpoint for a static website, mapped a custom domain, configured caching rules, and tested performance. |
| **09 – Private Endpoint for Storage** | `09-private-endpoint-storage/` | Created a storage account with public access denied, provisioned a private endpoint and private DNS zone, verified private IP resolution from a VM while public access was blocked. |
| **10 – Azure Files Shares** | `10-azure-files-shares/` | Created a file share with 100GB quota, mounted it on both Windows (Z: drive) and Linux (/mnt/shared-docs), and tested concurrent read/write. |
| **11 – Identity‑Based Access for Files** | `11-identity-based-access-files/` | Enabled Entra ID Kerberos authentication, assigned `Storage File Data SMB Share Contributor` to a user, and documented identity‑based mount vs. key‑based. |
| **12 – AzCopy & Storage Explorer** | `12-azcopy-and-storage-explorer/` | Transferred 50 blobs between containers with AzCopy, used sync for incremental changes, and used Storage Explorer for SAS generation and browsing. |
| **13 – Object Replication** | `13-object-replication/` | Configured cross‑region container‑level replication (East US → West US2) with versioning, tested blob upload and deletion behavior. |
| **14 – Storage Encryption** | `14-storage-encryption/` | Set up customer‑managed keys (CMK) with Key Vault, granted managed identity access, enabled auto‑rotation, and encrypted a blob with the CMK. |

## Key Concepts Covered
- **Account Types & Performance**: General‑purpose v2 vs. specialized Premium (BlockBlob, FileStorage) – when to use each.
- **Redundancy & DR**: LRS, ZRS, GRS, RA‑GRS, GZRS – trade‑offs between cost, durability, and read access to secondary.
- **Network Security**: Firewall IP rules, VNet service endpoints, and private endpoints – layered defense from public to fully private.
- **Data Lifecycle**: Access tiers (Hot, Cool, Cold, Archive), automated lifecycle management, rehydration behavior.
- **Access Control**: Access keys (rotation, disabling), SAS (account/service/user delegation), identity‑based authentication for Azure Files (Entra ID Kerberos).
- **Data Transfer & Sync**: AzCopy high‑performance copying/sync, Storage Explorer for GUI management.
- **Replication**: Object replication vs. geo‑redundancy – granular container‑level cross‑region replication.
- **Encryption**: SSE with Microsoft‑managed keys vs. customer‑managed keys (CMK) via Key Vault, auto‑rotation, and RBAC access.

## Deliverables
Each module contains its own set of deliverables (scripts, markdown files, screenshots, JSON policies) that together form a complete storage governance and operations portfolio.

This storage foundation ensures you can securely provision, scale, and manage Azure Storage services in line with enterprise requirements.