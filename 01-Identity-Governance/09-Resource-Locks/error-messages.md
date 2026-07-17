# Error Messages Captured

## Delete lock – attempting to delete VM

(Conflict) The resource 'locktest-vm' is locked with a Delete lock 'DeleteLock-VM'. The delete operation cannot be performed until the lock is removed.

## ReadOnly lock – attempting to stop VM

(Conflict) The resource 'locktest-vm' is locked with a ReadOnly lock 'ReadOnlyLock-VM'. The 'stop' operation cannot be performed because the lock prevents write operations.

## ReadOnly lock – attempting to update tags

(Conflict) The resource 'locktest-vm' is locked with a ReadOnly lock 'ReadOnlyLock-VM'. The 'update' operation cannot be performed.

## Inherited RG lock – attempting to delete VM

(Conflict) The resource 'locktest-vm' is protected by a Delete lock 'DeleteLock-RG' at the resource group scope. The operation is denied.

*(These messages are representative; the exact wording may differ slightly between portal and CLI.)*

---
![alt text](<Screenshot 2026-07-17 185924.png>)