# Azure RBAC Custom Roles

## Anatomy of a Custom Role

| Section | Purpose |
|---------|---------|
| **Actions** | Management plane operations the role can perform. These are REST API calls like `Microsoft.Compute/virtualMachines/restart/action`. |
| **NotActions** | Management plane operations **explicitly denied**, even if a wildcard `*` was used in `Actions`. Used to carve out exceptions. |
| **DataActions** | Data plane operations (e.g., `Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read`). |
| **NotDataActions** | Data plane operations explicitly denied. |
| **AssignableScopes** | Where the role can be assigned – subscription, resource group, management group. Controls visibility. |

## How We Built Our Role
- **Actions**: Only the specific VM control operations (start, restart, deallocate) and storage account read, plus the resource group read needed for visibility.
- **NotActions**: Empty (no exclusions needed).
- **DataActions**: None – we didn’t include blob access.
- **NotDataActions**: None.
- **AssignableScopes**: Single subscription, so the role can only be assigned within that subscription.

## Why Custom Roles?
- **Least privilege**: Grant exactly what’s needed, nothing more.
- **Consistency**: Create a role once, assign many times.
- **Auditability**: Built-in roles are generic; custom roles describe specific job functions.

## Limits
- Max 5000 custom roles per directory.
- Can be created at subscription or management group level.
- Requires `Microsoft.Authorization/roleDefinitions/write` permission (Owner or User Access Administrator).

## Overview
This project demonstrates creating and testing a **custom RBAC role** in Azure.  
The role allows restarting VMs and viewing storage accounts, but restricts deletion or creation.

---

## Steps Completed
1. Created custom role definition in JSON.  
2. Assigned role to user1 at RG scope.  
3. Tested VM and storage operations.  
4. Verified least privilege access.  

---

## Key Concepts
- **Actions** → Permissions granted (e.g., restart VM, read storage).  
- **NotActions** → Explicitly denied permissions.  
- **DataActions** → Permissions on data plane (e.g., blob read).  
- **AssignableScopes** → Defines where the role can be assigned (subscription, RG, resource).  
- **Custom Roles** → Stored at subscription or management group level.  

---

## Deliverables
- **custom-role.json** → Role definition.  
- **test-results.md** → Documented test cases.  
- **README.md** → Explanation of RBAC custom role concepts.  

---

## Lessons Learned
- Custom roles provide granular control beyond built-in roles.  
- AssignableScopes ensures roles are scoped correctly.  
- Testing validates least privilege principle.  

---

## Next Steps
- Create additional custom roles (e.g., Storage Contributor, Network Reader).  
- Explore **role inheritance** across subscription and RG.  
- Combine RBAC with **Azure Policy** for governance.

## Screenshot 

---
![alt text](<Screenshot 2026-07-16 194913.png>)