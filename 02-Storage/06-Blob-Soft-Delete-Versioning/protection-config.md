# Data Protection Configuration

**Storage Account**: `protectxyz123`  
**Features enabled**:

| Feature               | Configuration       | How Enabled |
|-----------------------|---------------------|-------------|
| Blob soft delete      | 7 days retention    | `--enable-blob-delete-retention true --blob-delete-retention-days 7` |
| Blob versioning       | Enabled             | `--enable-versioning true` |
| Container soft delete | 7 days retention    | `--enable-container-delete-retention true --container-delete-retention-days 7` |
| Immutable storage     | Enabled (account)   | `--enable-immutable-storage true` |
| Legal hold            | Set on container `legal-hold-demo` | `az storage container legal-hold set --tags "case-12345"` |

Commands used for initial creation:
```powershell
az storage account create ...
  --enable-versioning true
  --enable-blob-delete-retention true --blob-delete-retention-days 7
  --enable-container-delete-retention true --container-delete-retention-days 7
  --enable-immutable-storage true