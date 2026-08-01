# Recovery Services Vault vs. Backup Vault

| Feature | Recovery Services Vault | Backup Vault |
|--------|--------------------------|--------------|
| **Workloads** | Azure VMs, SQL in VM, SAP HANA, on‑premises servers | Azure Disks, Blobs, PostgreSQL, AKS |
| **Management** | Classic interface, extensive policy options | Modern interface, simpler policy model |
| **Policy Types** | Daily/Weekly/Monthly retention, GFS, hourly | Policy per disk/blob with retention rules |
| **Soft Delete** | Yes (14 days default) | Yes (configurable) |
| **Cross‑Region Restore** | Available with GRS vaults | Currently limited (check latest) |
| **Use Case** | Traditional VM and application backup | Cloud‑native resource backup (disks, blobs) |

## When to Use Each
- **Recovery Services Vault**: You have existing Azure VMs or hybrid servers to back up. You need granular retention policies.
- **Backup Vault**: You want to back up managed disks, storage blobs, or newer Azure services like AKS. The experience is more streamlined for those resources.

> Note: A single workload can only be backed up to one vault type (e.g., a VM can only be backed up to a Recovery Services vault, not a Backup vault).