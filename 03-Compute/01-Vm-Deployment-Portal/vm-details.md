# VM Specifications

## Windows VM
| Property | Value |
|----------|-------|
| Name | `winvm-portal` |
| OS | Windows Server 2022 Datacenter |
| Size | Standard_B2s (2 vCPU, 4 GiB) |
| Public IP | `20.xxx.xxx.xxx` (replace with actual) |
| Private IP | `10.3.0.4` |
| OS Disk | Standard SSD (127 GiB) |
| Boot Diagnostics | Managed |

## Linux VM
| Property | Value |
|----------|-------|
| Name | `linuxvm-portal` |
| OS | Ubuntu 22.04 LTS |
| Size | Standard_B2s |
| Public IP | `20.xxx.xxx.xxx` |
| Private IP | `10.3.0.5` |
| OS Disk | Standard SSD (30 GiB) |
| Boot Diagnostics | Managed |

## Network
- VNet: `vnet-compute-lab` (10.3.0.0/16)
- Subnet: `snet-default` (10.3.0.0/24)
- NSG rules: Allow RDP (3389) from Internet; Allow SSH (22) from Internet.