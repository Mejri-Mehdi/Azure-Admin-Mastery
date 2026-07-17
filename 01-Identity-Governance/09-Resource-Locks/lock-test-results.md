# Resource Lock Test Results

**VM**: `locktest-vm` in `rg-rbac-lab`

| Action               | No Lock  | Delete Lock | ReadOnly Lock |
|----------------------|----------|-------------|---------------|
| Delete VM            | Allowed  | ❌ Denied   | ❌ Denied     |
| Stop VM              | Allowed  | ✅ Allowed  | ❌ Denied     |
| Start VM             | Allowed  | ✅ Allowed  | ❌ Denied     |
| Add/Change Tag       | Allowed  | ✅ Allowed  | ❌ Denied     |
| Attach Data Disk     | Allowed  | ✅ Allowed  | ❌ Denied     |
| Modify Size          | Allowed  | ✅ Allowed  | ❌ Denied     |

**Inheritance test** (Delete lock on resource group):
- Attempt to delete the VM without a direct lock → **denied** due to inherited lock.

**Key observations**:
- A **Delete** lock only prevents deletion; all other modifications are allowed.
- A **ReadOnly** lock freezes the resource completely – no modifications of any kind.
- Locks are inherited from the resource group; a parent lock protects all child resources.