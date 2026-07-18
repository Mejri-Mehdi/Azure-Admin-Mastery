# Storage Firewall Configuration

**Storage Account**: `stfwxyz123`
**Resource Group**: `rg-storage-fw`

## Network Rules
- **Default action**: Deny (Selected networks)
- **Virtual Network rules**:
  - VNet: `vnet-storage`, subnet `snet-vm` (service endpoint: Microsoft.Storage enabled)
- **IP rules** (added then removed for testing):
  - `***.***.***.***/32` (my local public IP)

## Configuration Commands
```powershell
# Enable service endpoint
az network vnet subnet update --vnet-name vnet-storage --name snet-vm -g rg-storage-fw --service-endpoints Microsoft.Storage

# Switch to selected networks
az storage account update -n stfwxyz123 -g rg-storage-fw --default-action Deny

# Add VNet rule
az storage account network-rule add -n stfwxyz123 -g rg-storage-fw --vnet-name vnet-storage --subnet snet-vm

# Add IP rule
az storage account network-rule add -n stfwxyz123 -g rg-storage-fw --ip-address "***.***.***.***/32"

# Remove IP rule
az storage account network-rule remove -n stfwxyz123 -g rg-storage-fw --ip-address "***.***.***.***/32"