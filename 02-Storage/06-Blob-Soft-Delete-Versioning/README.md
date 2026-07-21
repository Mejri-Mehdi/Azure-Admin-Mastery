# Soft Delete, Versioning, and Immutability

Azure Blob Storage offers multiple data protection mechanisms:

- **Soft delete (blobs)**: Deleted blobs are retained for a configurable period (1–365 days). They can be recovered (undeleted) before permanent purge.
- **Versioning**: Every write operation creates a new blob version, preserving the previous state. Previous versions can be read, restored, or permanently deleted.
- **Container soft delete**: Deleted containers are retained and can be restored with all their content.
- **Immutable storage (WORM)**: Supports time‑based retention and legal holds. Data cannot be modified or deleted until the retention period expires or the legal hold is lifted. This is critical for compliance (e.g., SEC 17a-4).

## How They Complement Each Other
- **Versioning + soft delete**: Overwriting a blob creates a new version, and if the blob is deleted, the soft delete keeps all versions. You can restore any previous version or the current state.
- **Container soft delete**: Protects against accidental container deletion.
- **Immutability**: Provides a higher level of protection for regulatory compliance, preventing any modification, even by administrators.

## Our Tests
- Enabled all features, demonstrated version history after overwrite.
- Soft‑deleted blob and recovered by copying a version.
- Deleted and restored the container.
- Applied a legal hold and verified that overwrite is blocked.

These features form a layered defense against accidental deletion, ransomware, and insider threats.

## Screenshots

---
![alt text](<Screenshot 2026-07-21 184724.png>)
---
![alt text](<Screenshot 2026-07-21 184734.png>)
---
![alt text](<Screenshot 2026-07-21 192204.png>)
---
![alt text](<Screenshot 2026-07-21 192210.png>)
---
![alt text](<Screenshot 2026-07-21 194031.png>)
---

## Lessons Learned
- Soft delete provides safety net for accidental deletions.  
- Versioning enables rollback to previous blob states.  
- Immutable storage enforces compliance and legal requirements.  