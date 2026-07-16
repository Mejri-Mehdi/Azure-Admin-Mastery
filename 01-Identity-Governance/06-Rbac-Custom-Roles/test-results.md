# Custom Role Test Results – user1

**Role**: VM Restarter and Storage Viewer  
**Scope**: Resource group `rg-rbac-lab`

| Test Case | Action | Expected | Actual | Result |
|-----------|--------|----------|--------|--------|
| Restart VM | `az vm restart` on testvm | Allowed | Allowed | ✅ |
| Start VM | `az vm start` on testvm | Allowed | Allowed | ✅ |
| Deallocate VM | `az vm deallocate` on testvm | Allowed | Allowed | ✅ |
| Delete VM | `az vm delete` on testvm | Denied | Denied (Insufficient privileges) | ✅ |
| List storage accounts | `az storage account list` | Allowed (read) | Displayed account | ✅ |
| Create storage account | Portal “Create” | Denied | Button greyed out / error | ✅ |
| Delete storage account | Portal Delete | Denied | Error message | ✅ |
| View resource group | `az group show` | Allowed | Displayed | ✅ |
| Assign role | IAM → Add | Denied | Not available | ✅ |

**Conclusion**: The custom role grants exactly the permissions defined: VM start/restart/deallocate, storage account read, and resource group read. No extra privileges were observed.