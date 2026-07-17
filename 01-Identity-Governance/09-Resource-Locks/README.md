# Azure Resource Locks

## Lock Types
- **Delete** (CanNotDelete)  
  - Authorized users can still read and modify a resource, but they **cannot delete** it.
  - Ideal for preventing accidental deletion of critical resources.

- **ReadOnly** (ReadOnly)  
  - Authorized users can **only read** the resource; no modifications or deletions are allowed.
  - Similar to granting every user the Reader role, but even Owners are blocked.
  - Used for highly sensitive resources that must never be changed.

## Who Can Manage Locks?
Only users with the **Owner** or **User Access Administrator** role can create, modify, or delete locks. Even a Contributor cannot remove a lock they did not create.

## Scope Inheritance
- Locks applied at a **subscription or resource group** level are automatically inherited by all child resources.
- A ReadOnly lock at the resource group level makes every VM, storage account, etc., within that group read‑only.
- To modify a locked resource, the lock must be removed **from the exact scope where it was applied** (or from a parent).

## Common Pitfalls
- **Forgetting locks prevent automation**: CI/CD pipelines that try to delete or update a locked resource will fail.
- **ReadOnly locks can break portal operations**: Even the “Stop” button on a VM is greyed out because it’s a write action.
- **Locks do not affect data plane operations**: A ReadOnly lock on a storage account prevents management operations (like changing settings), but data inside (blob read/write) is still controlled by RBAC/data plane roles.

## Best Practice
- Use **Delete locks** on critical infrastructure (VMs, databases, resource groups) to avoid accidental deletion.
- Reserve **ReadOnly locks** for network security groups, route tables, or golden images that must stay unchanged.
- Always document locks in runbooks so new team members understand why they can’t perform certain actions.

## Lessons Learned
- Locks are a governance safeguard against accidental changes.  
- Delete locks protect critical resources from removal.  
- ReadOnly locks enforce strict immutability.  
- Understanding scope inheritance is essential for governance.  