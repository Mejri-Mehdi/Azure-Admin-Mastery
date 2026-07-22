# Object Replication Test

## Setup
- **Source**: `objsrceusxyz123` (East US), container `docs`
- **Destination**: `objdestwus2xyz123` (West US2), container `docs-replica`
- **Replication policy**: `docs-replication` – copies all objects from `docs` to `docs-replica`

## Tests

### 1. Upload and replication
- Uploaded `repl-test.txt` to source container.
- After ~3 minutes, blob appeared in destination container with same name and content.
- Verified with `az storage blob list` on destination.

### 2. Delete behavior
- Deleted `repl-test.txt` from source container.
- After 5 minutes, checked destination: the blob **still exists**. (The policy did not include "Delete blobs" rule, so deletions are not replicated.)
- If “Delete blobs” was enabled, the current version would be marked as deleted but previous versions would be preserved due to versioning.

### 3. Update (new version)
- Uploaded a new version of `repl-test.txt` with different content.
- Within minutes, the updated blob appeared in destination as a new version.
- Both old and new versions are available in the destination, thanks to versioning.

## Replication Lag
- Typical replication latency: 2–10 minutes for small blobs. Larger files may take longer.
- Latency depends on region distance, blob size, and service load.

## Key Observations
- Versioning **must** be enabled on both accounts; otherwise replication fails.
- The policy is set at the source account level.
- Replication is asynchronous; there is no direct sync between source and destination.
- You can have multiple rules in one policy (e.g., different containers or prefix filters).