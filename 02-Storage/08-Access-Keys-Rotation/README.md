# Storage Account Access Keys and Rotation

## Understanding Storage Account Keys
Each Azure storage account comes with two 512‑bit access keys: **key1** (primary) and **key2** (secondary). These keys grant **full administrative access** to the storage account – anyone with a key can manage blobs, files, queues, and tables.

## Why Key Rotation Matters
- **Security hygiene**: Regularly changing keys limits the window of exposure if a key is accidentally leaked.
- **Zero‑downtime rotation**: Because two keys exist, you can regenerate one while the other remains active, preventing application outages.

## Best Practices
1. **Automate rotation** using Azure Key Vault and a scheduling tool (e.g., Azure Automation, Functions).
2. **Audit key usage** with storage logs and set alerts for any key‑based activity.
3. **Disable shared key access** as a baseline – enable Azure AD authentication and RBAC instead.
4. **Use SAS tokens** when delegation is needed, preferring user delegation SAS over account SAS.
5. **Never hard‑code keys** in application code; use Key Vault references or Managed Identities.

## Our Lab
- Created a storage account, uploaded a blob using key1.
- Rotated key1 → old key1 stopped working immediately.
- Key2 remained valid, demonstrating seamless rotation capability.
- Then disabled shared key access entirely → even key2 could no longer authenticate.
- This illustrates the path from legacy key usage to modern, identity‑based security.

## Screenshots

---
![alt text](<Screenshot 2026-07-22 081207.png>)
---
![alt text](<Screenshot 2026-07-22 081136.png>)
---
![alt text](<Screenshot 2026-07-22 081428.png>)
---

## Lessons Learned
- Rotating keys invalidates old credentials immediately.  
- Disabling key access enforces identity-based authentication.  
- SAS and Entra ID provide scoped, revocable access.  