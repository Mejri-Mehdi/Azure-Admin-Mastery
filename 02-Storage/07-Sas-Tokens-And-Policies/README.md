# SAS Tokens & Stored Access Policies: Security Best Practices

## What is a SAS?
A Shared Access Signature (SAS) provides delegated, time‑limited access to Azure Storage resources without exposing the account key.

## Types of SAS
- **Account SAS**: signs a URL with account key, can grant access to multiple services.
- **Service SAS**: restricted to one service (blob, file, queue, table), also signed with account key.
- **User Delegation SAS**: introduced for Blob storage, signed with Azure AD credentials and does **not** use the account key.

## Stored Access Policies
A stored access policy is a **server‑side** policy attached to a container that defines permissions and expiry. Multiple Service SAS tokens can reference the same policy. The key benefit: you can **revoke** all SAS tokens that rely on the policy by deleting or modifying the policy.

## Security Best Practices
1. **Always use HTTPS** – ensure SAS tokens are only transmitted over secure channels.
2. **Apply IP restrictions** – if possible, limit the SAS to a known IP address or range.
3. **Use short expiry times** – SAS tokens should have the minimal required lifetime.
4. **Prefer User Delegation SAS** – eliminates the risk of key leakage, and revocation is tied to user identity.
5. **Use Stored Access Policies for Service SAS** – they provide a single point of revocation.
6. **Never hardcode SAS tokens** – use Azure Key Vault or secure configuration management.
7. **Monitor SAS usage** – Azure Storage logs can show which SAS tokens were used and when.

## Our Lab
We created and tested Account SAS, Service SAS, and User Delegation SAS. Then we defined a stored access policy, generated a SAS from it, and demonstrated revocation by deleting the policy. This shows how to balance convenience and security in shared storage access.

---

## Lessons Learned
- SAS tokens provide flexible, time‑bound access.  
- User Delegation SAS avoids exposing account keys.  
- Stored Access Policies enable centralized revocation.  
- Security requires HTTPS‑only and IP restrictions.  