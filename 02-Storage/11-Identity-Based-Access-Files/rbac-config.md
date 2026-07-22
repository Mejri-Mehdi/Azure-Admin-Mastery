# RBAC Configuration for Identity‑Based File Access

## Storage Account: `idfilestgxyz123`
- **Identity‑based authentication**: Enabled (Microsoft Entra Domain Services / Active Directory)
- **File share**: `secured-docs` (quota 100 GiB)

## Role Assignment
| User  | Role                                              | Scope             |
|-------|---------------------------------------------------|-------------------|
| user1 | Storage File Data SMB Share Contributor           | Storage Account   |
| user2 | None                                              | N/A               |

**Explanation:**
- `Storage File Data SMB Share Contributor` grants user1 read, write, and delete access at the share level via SMB.
- `Storage File Data SMB Share Reader` would give read‑only access.
- `Storage File Data SMB Share Elevated Contributor` also allows modifying NTFS permissions.
- Without any role, user2 cannot mount or browse the share, even if the VM has network connectivity.

## Azure CLI Commands
```powershell
# Enable identity (portal only)
# Assign role
az role assignment create `
  --assignee "user1@tenant.onmicrosoft.com" `
  --role "Storage File Data SMB Share Contributor" `
  --scope "/subscriptions/.../resourceGroups/rg-identity-files/providers/Microsoft.Storage/storageAccounts/idfilestgxyz123"