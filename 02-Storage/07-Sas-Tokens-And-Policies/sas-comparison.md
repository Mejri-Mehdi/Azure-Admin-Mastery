# SAS Token Comparison

| Feature | Account SAS | Service SAS | User Delegation SAS |
|--------|--------------|-------------|---------------------|
| **Scope** | Multiple services (Blob, File, Queue, Table) | Single service (e.g., Blob) | Single service (Blob) |
| **Authentication** | Account key | Account key or Stored Access Policy | Azure AD (user identity) |
| **Security** | Key‑based; potential exposure | Key‑based unless using Stored Access Policy | Most secure; no key exposure, tied to user permissions |
| **Revocation** | Not directly; rely on short expiry | Via Stored Access Policy | Via Azure AD (disable user, revoke tokens) |
| **Granularity** | Can restrict resource types and services | Per blob, container, queue, etc. | Per blob, container |
| **Best for** | Bulk delegation across services | Specific resource access | Least privilege, zero trust, keyless |

## Common Parameters
- **expiry**: start and end time (max lifetime varies by type)
- **permissions**: read (r), write (w), delete (d), list (l), etc.
- **ip**: restrict to a single IP or CIDR range
- **https-only**: enforce secure transport (default true)