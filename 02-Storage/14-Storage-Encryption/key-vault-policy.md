# Key Vault Access Policy for Storage Encryption

Instead of legacy access policies, we used **Azure RBAC** (role‑based access control) to grant the storage account permission to use the key.

## Role Assignment
| Identity | Role | Scope |
|----------|------|-------|
| Storage account system‑assigned managed identity (`cmkstgxyz123`) | **Key Vault Crypto Service Encryption User** | Key Vault `kv-cmk-stg-xyz123` |

This role allows the following operations on keys:
- `get` (retrieve key metadata)
- `wrapKey` (encrypt the account encryption key)
- `unwrapKey` (decrypt the account encryption key)

## Why Not Access Policies?
Azure Key Vault now supports RBAC for authorization. Using RBAC provides unified management and fine‑grained control, and is the recommended approach for new deployments.

## Verification
- In the portal, navigate to Key Vault `kv-cmk-stg-xyz123` → **Access control (IAM)** → **View access for this resource**.
- Search for `cmkstgxyz123`; you will see the “Key Vault Crypto Service Encryption User” role.