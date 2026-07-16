# RBAC Matrix – rg-rbac-lab

| User  | Role                         | Scope                        | Can Create Resources | Can Delete Resources | Can Assign Roles | Can Read Blob Data |
|-------|------------------------------|------------------------------|-----------------------|----------------------|------------------|-------------------|
| user1 | Owner                        | Resource Group `rg-rbac-lab` | ✅ Yes               | ✅ Yes              | ✅ Yes          | N/A               |
| user2 | Contributor                  | Resource Group `rg-rbac-lab` | ✅ Yes               | ✅ Yes              | ❌ No           | N/A               |
| user3 | Reader                       | Resource Group `rg-rbac-lab` | ❌ No                | ❌ No               | ❌ No           | N/A               |
| user4 | Virtual Machine Contributor  | Resource Group `rg-rbac-lab` | Only VMs             | Only VMs            | ❌ No           | N/A               |
| user5 | Storage Blob Data Reader     | Storage Account `rbaclabstgxyz` | ❌ No (account level) | ❌ No            | ❌ No           | ✅ Yes (only blobs) |

**Inheritance**: All resource group assignments also apply to resources within the group, except user5’s assignment which is scoped to a specific resource.