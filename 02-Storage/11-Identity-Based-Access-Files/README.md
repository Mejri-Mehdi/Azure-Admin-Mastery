# Identity‑Based Access for Azure Files

## Overview
Azure Files now supports identity‑based authentication over SMB using Microsoft Entra ID (Azure AD) Kerberos. Instead of sharing a storage account key, each user authenticates with their own identity, enabling granular RBAC and NTFS controls.

## How It Works
1. **Identity source**: Either Microsoft Entra Domain Services or an on‑premises Active Directory synced with Azure AD Connect.
2. **Enable identity‑based access** on the storage account.
3. **Assign RBAC roles** at the storage account level to control share‑level access.
4. **Mount the share** from a domain‑joined VM; the user’s Kerberos ticket authenticates them.
5. **NTFS permissions** on directories/files provide additional granularity.

## Key Roles for Azure Files

| Role | Permissions |
|------|------------|
| Storage File Data SMB Share Reader | Read‑only access to the share |
| Storage File Data SMB Share Contributor | Read, write, delete on the share |
| Storage File Data SMB Share Elevated Contributor | Contributor + modify NTFS permissions |

## Identity‑Based vs Key‑Based Access

| Feature | Key‑Based | Identity‑Based |
|--------|----------|----------------|
| **Authentication** | Storage account key | Entra ID Kerberos |
| **Authorization** | None (full control) | RBAC + NTFS |
| **Audit logs** | Anonymous (key) | User‑specific identity in logs |
| **Key rotation** | Required | Not applicable |
| **Granularity** | All or nothing | Per‑user, per‑share, per‑file |

## Prerequisites for Production
- Microsoft Entra Domain Services (managed domain) or hybrid AD with Azure AD Connect.
- Domain‑joined Windows VMs (or Linux with Samba 4.7+ for Kerberos).
- Users must be hybrid identities (synced from on‑prem AD or cloud‑only in Entra DS).

## Our Lab
- Enabled identity‑based access on the storage account.
- Assigned the Contributor role to user1; user2 received no role.
- Demonstrated that user1 can mount and write, user2 cannot.
- (If domain‑joined) Verified that no key was used during mount.
- (If not domain‑joined) Documented the expected behaviour and the dependency on domain infrastructure.

---

## Lessons Learned
- Identity-based access eliminates the need to distribute storage keys.  
- RBAC provides centralized, role-based control.  
- NTFS permissions allow granular file-level security.  