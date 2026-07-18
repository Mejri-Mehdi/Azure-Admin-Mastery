# Lifecycle Management vs Manual Tiering

## What is Blob Lifecycle Management?
Azure Blob Storage lifecycle management allows you to define rules that automatically transition blobs between access tiers or delete them based on the last modification date.

## Lifecycle Management (Automated)
- **How**: Define rules in the storage account that run daily.
- **Use case**: Large datasets where manual tier management is impractical.
- **Advantages**:
  - Set-and-forget: once configured, blobs move automatically.
  - Cost optimisation: ensures data is always in the cheapest appropriate tier.
  - Consistent enforcement: avoids human error or ad‑hoc decisions.
- **Limitations**:
  - Minimum storage duration per tier still applies (early deletion fees).
  - Policy runs daily; changes are not instant.

## Manual Tiering
- **How**: Use Azure portal, CLI, or SDK to explicitly set a blob’s tier.
- **Use case**: Small number of blobs, or blobs that need immediate tier change.
- **Advantages**:
  - Instant control: you can move a blob right now.
  - Granular: apply tier changes to individual blobs without rules.
- **Limitations**:
  - Time‑consuming for large storage accounts.
  - Easy to forget, leading to higher costs.

## Our Demo
We created a lifecycle policy with three rules targeting blobs with the prefix `documents/important/`. This simulates a real‑world scenario where important documents transition from Hot to Cool, then Archive, then deletion, while other data remains in Hot (unmanaged).

## Screenshots

---
![alt text](<Screenshot 2026-07-18 184603.png>)
---
![alt text](<Screenshot 2026-07-18 184019.png>)
---

## Lessons Learned
- Lifecycle management reduces cost by automating tier transitions.  
- Prefix filters allow targeted policies for specific paths.  
- Deletion rules prevent accumulation of stale data.  