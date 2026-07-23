# VM Deployment via Portal – Step‑by‑Step

## Resource Group
- Created `rg-compute-lab` in East US.

## Windows VM (`winvm-portal`)
**Basics**:
- Image: Windows Server 2022 Datacenter Gen2
- Size: Standard_B2s (2 vCPUs, 4 GiB RAM)
- Authentication: Password (admin user: `azureadmin`)
- Inbound ports: RDP (3389)

**Disks**:
- OS disk: Standard SSD (E4, 127 GiB)
- No data disks

**Networking**:
- VNet: `vnet-compute-lab` (10.3.0.0/16), subnet `snet-default` (10.3.0.0/24)
- Public IP: `winvm-pip`, SKU Standard, dynamic allocation
- NSG: Basic (allow RDP)

**Management**:
- Boot diagnostics: Managed
- Auto‑shutdown: Off

## Linux VM (`linuxvm-portal`)
**Basics**:
- Image: Ubuntu Server 22.04 LTS Gen2
- Size: Standard_B2s
- Authentication: SSH public key (user: `azureuser`)
- Inbound ports: SSH (22)

**Disks**:
- OS disk: Standard SSD (30 GiB)

**Networking**:
- Same VNet/subnet
- Public IP: `linuxvm-pip`, SKU Standard
- NSG: Basic (allow SSH)

**Management**: Boot diagnostics managed.

## Post‑Deployment
- RDP into Windows VM successful.
- SSH into Linux VM successful.
- Both VMs can communicate within the VNet.