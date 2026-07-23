# VM Resize Test

## Objective
Resize a VM from **Standard_B2s** to **Standard_D2s_v3** without losing data or configuration.

## Steps
1. Create VM `vm-move-test` with size `Standard_B2s`.
2. Deallocate: `az vm deallocate -n vm-move-test -g rg-vm-move`.
3. Resize: `az vm resize -n vm-move-test -g rg-vm-move --size Standard_D2s_v3`.
4. Start: `az vm start -n vm-move-test -g rg-vm-move`.
5. Verify: `az vm show -n vm-move-test -g rg-vm-move --query hardwareProfile.vmSize`.

## Results
- Original size: `Standard_B2s` (2 vCPUs, 4 GiB RAM)
- New size: `Standard_D2s_v3` (2 vCPUs, 8 GiB RAM)
- OS disk and data disks unchanged.
- Resize succeeded without errors.

## Key Points
- VM must be in **stopped (deallocated)** state to resize.
- Not all sizes are available in every region or cluster; if the target size is unavailable, you may need to move to another availability zone or region.
- Resizing does **not** change the OS disk, IP addresses, or extensions.