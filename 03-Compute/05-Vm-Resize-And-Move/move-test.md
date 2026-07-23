# VM Move Test (Resource Group)

## Objective
Move a VM and its dependent resources from **rg-vm-move** to **rg-vm-destination**.

## Resources Moved
- Virtual Machine `vm-move-test`
- Network Interface `vm-move-testVMNic`
- OS Managed Disk `vm-move-test_disk1_<unique>`
- Public IP Address `vm-move-testPublicIP`

## Steps
1. Identify resource IDs of the VM, NIC, OS disk, and public IP.
2. Run `az resource move --destination-group rg-vm-destination --ids ...`.
3. Validate move: the operation first validates that all resources can be moved. Then it moves them.
4. After success, the VM is fully functional in the new resource group.

## Results
- VM successfully moved to `rg-vm-destination`.
- Public IP, NIC, and OS disk moved along with it.
- RDP access using the same public IP still works.

## Move Limitations (General)
- Some resources cannot be moved: e.g., a VM with a classic (unmanaged) disk, a VM in an availability set cannot move to a different availability set in another region, and cross‑region move is not supported directly.
- Resources in a locked resource group cannot be moved.
- A VM must be deallocated to move? Actually, moving between resource groups does not require deallocation; but some dependent resources like public IP might need to be dissociated first. In our test, the move succeeded while the VM was deallocated.
- The move operation may take several minutes.

## Cross‑Region Move
- Direct cross‑region move of a VM using `az resource move` is **not supported**.
- To migrate to another region, use **Azure Resource Mover** (Preview) or a manual process:
  1. Create a snapshot of the OS disk.
  2. Copy the snapshot to the target region (using Azure Storage or AzCopy).
  3. Create a new managed disk from the snapshot in the target region.
  4. Create a new VM in the target region, attaching the disk.
  5. Reconfigure networking and IP.
- Azure Site Recovery can also orchestrate region migration for disaster recovery.