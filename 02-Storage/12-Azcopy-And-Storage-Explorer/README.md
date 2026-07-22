# AzCopy, Storage Explorer, and Data Transfer Tools

## AzCopy
- **Command‑line tool** for high‑performance, scriptable data transfer.
- Supports **copy**, **sync**, and **remove** operations.
- Can use Azure AD authentication (`azcopy login`) or SAS tokens.
- Ideal for **automation**, **CI/CD pipelines**, and **bulk migrations**.
- Runs on Windows, Linux, and macOS.

## Azure Storage Explorer
- **Graphical user interface** for browsing and managing Azure Storage.
- Connects to multiple accounts via Azure AD or connection strings.
- Useful for **ad‑hoc exploration**, **troubleshooting**, **generating SAS tokens**, and **small uploads/downloads**.
- Not suited for high‑volume scripted transfers.

## Azure Data Box
- **Physical appliance** shipped by Microsoft for **offline** data transfer.
- Designed for **large datasets (terabytes to petabytes)** where network transfer is too slow or expensive.
- Data is copied to the device locally, then shipped back to Azure and uploaded.
- Use cases: one‑time mass migration, disaster recovery seeding.

## Choosing the Right Tool

| Scenario | Recommended Tool |
|----------|------------------|
| Automated nightly copy of blobs between containers | AzCopy |
| Browse, rename, or delete a few blobs | Storage Explorer |
| Move 500 TB from on‑premises to Azure | Data Box |
| Sync a local folder with a blob container | AzCopy sync |
| Generate a SAS token for a partner | Storage Explorer |
| Script a migration of 10 million blobs | AzCopy |

## Our Lab
- Used AzCopy to copy 50 blobs between containers.
- Used AzCopy sync to propagate incremental changes.
- Connected Storage Explorer to verify contents and generate SAS tokens.
- Demonstrated that AzCopy is efficient for bulk operations, while Storage Explorer is best for interactive work.

## Screenshots

---
![alt text](<Screenshot 2026-07-22 201947.png>)
---
![alt text](<Screenshot 2026-07-22 202421.png>)
---
![alt text](<Screenshot 2026-07-22 205123.png>)
---
![alt text](<Screenshot 2026-07-22 205334.png>)
---
![alt text](<Screenshot 2026-07-22 205622.png>)
---

## Lessons Learned
- AzCopy is best for automation and large-scale transfers.  
- Storage Explorer simplifies exploration and SAS generation.  
- Data Box is necessary for very large datasets.  