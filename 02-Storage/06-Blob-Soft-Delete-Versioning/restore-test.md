### B. `restore-test.md`

# Restore Test Steps

## Blob Soft Delete & Versioning Restore
1. Uploaded `report.pdf` twice to create two versions.
2. Deleted `report.pdf` (soft delete).
3. Listed blobs with `--include-versions` to get version ID of deleted current version.
4. Copied the deleted version back to `report.pdf` using `az storage blob copy start` with the version ID.
5. Blob restored as current version.

**Command to copy from version**:
```powershell
az storage blob copy start `
  --source-account-name protectxyz123 `
  --source-container documents `
  --source-blob report.pdf `
  --source-version-id "<version-id>" `
  --destination-container documents `
  --destination-blob report.pdf `
  --account-name protectxyz123 `
  --auth-mode login

```

## Container Soft Delete Restore

Deleted container documents.

Ran az storage container restore --name documents – container restored with all blobs and versions intact.

## Legal Hold Immutability

Applied legal hold on container legal-hold-demo.

Blob uploaded successfully, but overwrite was denied with 409 error.

After clearing legal hold, overwrite allowed.