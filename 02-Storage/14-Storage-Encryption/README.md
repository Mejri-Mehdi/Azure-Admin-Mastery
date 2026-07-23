# Storage Service Encryption (SSE) – Customer-Managed Keys

## SSE Overview
Azure Storage always encrypts data at rest using **Storage Service Encryption (SSE)**. Encryption cannot be disabled and is free. The question is only *who manages the keys*.

## Encryption Key Options
1. **Microsoft‑managed keys**  
   - Default.  
   - Microsoft generates, stores, and rotates the keys.  
   - No user action required; fully transparent.

2. **Customer‑managed keys (CMK)**  
   - You create and manage an RSA or EC key in Azure Key Vault (or a Hardware Security Module).  
   - Storage account uses that key to wrap/unwrap the account encryption key.  
   - Provides full control over key rotation, revocation, and auditing.  
   - Supports auto‑rotation (when enabled).  
   - Typically used for compliance/regulatory requirements.

3. **Customer‑provided keys (CPK)**  
   - You supply the encryption key per API request.  
   - Rare; used in specialized scenarios.  
   - Key is not stored by Azure.

## CMK in Action
- The storage account has a system‑assigned managed identity.  
- That identity is granted the **Key Vault Crypto Service Encryption User** role on the key vault.  
- The storage account wraps its internal account encryption key with the CMK.  
- When data is written, the account encryption key encrypts the data; the CMK protects the account encryption key.  
- Key rotation, revocation, and audit logs are managed in Key Vault.

## Key Management Best Practices
- Enable **soft‑delete** and **purge protection** on the key vault (required by Azure Storage).  
- Use **Azure Policy** to enforce that new storage accounts use CMK.  
- Monitor key usage with Key Vault logs and set up alerts for expired or disabled keys.  
- Avoid deleting the key; if you revoke access, the storage account will go into a read‑only state after a few minutes.

## Our Implementation
- Created a Key Vault with purge protection and soft‑delete.  
- Created an RSA 2048‑bit key.  
- Granted the storage account’s managed identity the required RBAC role.  
- Enabled CMK on the storage account with auto‑rotation.  
- Uploaded a blob; it is automatically encrypted with the CMK.  
- Verified the role assignment in Key Vault.

## Screenshot

---
![alt text](<Screenshot 2026-07-23 151243.png>)
---

## Lessons Learned
- CMK provides greater control and compliance.  
- Auto-rotation ensures keys remain fresh without manual intervention.  
- Key Vault access policies must be configured correctly for Storage to use CMK.  
