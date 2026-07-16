# RBAC Testing Results

## Environment
- Resource group: `rg-rbac-lab`  
- Storage account: `rbaclabstgxyz`  
- Tests performed via incognito browser sessions and Azure CLI.

## user1 (Owner)
- Created a virtual network and a storage account.
- Deleted the created resources.
- Successfully assigned `Reader` role to user3.
- **Verdict**: Full administrative control over the resource group.

## user2 (Contributor)
- Successfully created a VM and a storage account.
- Attempted to assign `Reader` role to user4 → error: *"Insufficient privileges"*.
- Deleted the VM.
- **Verdict**: Can manage resources, cannot manage access.

## user3 (Reader)
- Was able to see all resources in the group.
- Tried to create a storage account → the Create button was greyed out.
- **Verdict**: Read‑only, as expected.

## user4 (Virtual Machine Contributor)
- Successfully created a VM.
- Tried to create a storage account → access denied.
- **Verdict**: VM‑specific permissions only.

## user5 (Storage Blob Data Reader)
- Opened the Azure portal → could not browse to the storage account (not visible in resource groups).
- Using Azure CLI with user5 login, successfully listed blobs from a container (after creating a container as admin and granting appropriate data plane access).
- **Verdict**: No management plane access; only data plane (blob read) works.

## Key Takeaway
- Roles are additive and scope‑bound.
- The portal reflects management plane permissions; data plane roles require specific authentication.

