# Why Avoid Access Keys – Security Recommendations

## Risks of Shared Key Access
- **Full account access**: Anyone with a key can read, write, delete, and modify the entire storage account.
- **Hard to revoke or scope**: Keys cannot be limited to specific containers, blobs, or operations.
- **Rotation burden**: Manual or automated rotation is required; a leaked key is a critical security incident.
- **No identity**: Actions performed with a key appear as "anonymous" in logs, making auditing difficult.

## Recommended Approaches
1. **Use Microsoft Entra ID (Azure AD) authentication**  
   - Assign RBAC roles (e.g., `Storage Blob Data Contributor`) to users or managed identities.
   - All requests are identity‑based, logged, and can be controlled with Conditional Access policies.
   - Disable shared key access entirely (`--allow-shared-key-access false`).

2. **Use Shared Access Signatures (SAS)**  
   - Granular permissions (read/write/list for a specific container/blob).
   - Time‑limited and can be revoked via stored access policies.
   - Use **user delegation SAS** (backed by Entra ID) for maximum security.

3. **Managed Identities for Azure resources**  
   - VMs, App Services, and Functions can authenticate to storage without any key or secret.
   - Credentials are automatically rotated by Azure.

## Microsoft’s Stance
“Microsoft recommends that you use Azure AD authentication whenever possible, instead of using the account access keys to authorize requests against Azure Storage.”  
– [Azure Storage security documentation](https://learn.microsoft.com/azure/storage/blobs/authorize-access-azure-active-directory)

## Our Demonstration
- Access key rotation showed that an old key immediately becomes invalid.
- Disabling shared key access entirely blocked all key‑based requests, forcing Entra ID authentication.
- This proves that moving away from keys reduces the risk surface dramatically.