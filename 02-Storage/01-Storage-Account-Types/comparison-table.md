# Storage Account Types Comparison

| Account Name   | Kind                | SKU          | Replication | Performance | Access Tier (default) | Secure Transfer | Supports Blobs | Supports Files | Supports Queues/Tables |
|----------------|---------------------|--------------|-------------|-------------|-----------------------|-----------------|----------------|----------------|------------------------|
| stdv2lrs       | StorageV2           | Standard_LRS | LRS         | Standard    | Hot                   | Yes (required)  | Yes            | Yes            | Yes                    |
| premblk        | BlockBlobStorage    | Premium_LRS  | LRS         | Premium     | N/A                   | Yes (required)  | Yes (block)    | No             | No                     |
| premfile       | FileStorage         | Premium_LRS  | LRS         | Premium     | N/A                   | Yes (required)  | No             | Yes (files)    | No                     |
| stdv2grs       | StorageV2           | Standard_GRS | GRS         | Standard    | Hot                   | Yes (required)  | Yes            | Yes            | Yes                    |

**Notes:**
- **Access tier** is only applicable to Standard v2 accounts (Hot, Cool, Cold, Archive).
- **Secure transfer required** is enabled by default and forces HTTPS for all requests.
- Premium accounts only support locally redundant storage (LRS) or zone-redundant storage (ZRS) in some regions.
- BlockBlobStorage is optimised for low‑latency block blob workloads and does **not** support file shares, queues, or tables.
- FileStorage is optimised for high‑performance SMB and NFS file shares.
- Standard v2 is the general‑purpose account type that supports all services.