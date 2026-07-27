# Bastion Configuration

## VNet: `vnet-bastion` (10.0.0.0/16)
- **Subnet `snet-vm`** (10.0.1.0/24): Hosts the private VM.
- **Subnet `AzureBastionSubnet`** (10.0.2.0/26): Dedicated to the Bastion host.

## VM: `vm-private`
- **OS**: Ubuntu 22.04
- **Size**: Standard_B2s (adjust if needed)
- **Public IP**: None
- **Private IP**: 10.0.1.4 (obtained from `az vm show`)

## Bastion Host: `bastion-host`
- **SKU**: Standard
- **Public IP**: `bastion-pip` (used only by the Bastion service)
- **Concurrent sessions**: Up to 50 (Standard)
- **Features**: Browser‑based SSH, file transfer, copy‑paste, native client support.

## Deployment Command
```powershell
az network bastion create --name bastion-host -g rg-bastion --vnet-name vnet-bastion --location eastus --sku Standard --public-ip-address bastion-pip