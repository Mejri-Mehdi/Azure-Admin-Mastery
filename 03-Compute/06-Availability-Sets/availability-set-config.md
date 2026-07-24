# Availability Set Configuration

## Availability Set: `avset-demo`
- **Resource Group**: `rg-avset`
- **Fault Domains**: 2
- **Update Domains**: 5
- **Region**: East US

## VMs Deployed
| VM Name | Fault Domain (observed) | Update Domain (observed) | SKU |
|---------|--------------------------|--------------------------|-----|
| vm1-av  | 0                        | 0 (or 1, varies)         | Standard_B2s |
| vm2-av  | 1                        | 1 (or 2, varies)         | Standard_B2s |

Both VMs share the same virtual network and public IP SKU (Standard).

## Fault Domain vs Update Domain Distribution
- **Fault domains** represent physical racks sharing power and network. Our 2 FDs mean the VMs are guaranteed to be on different physical hardware, reducing the risk of simultaneous hardware failure.
- **Update domains** are groups that can be rebooted sequentially during planned maintenance. With 5 UDs, only 20% of the VMs would be rebooted at a time.

## SLA
- Availability Set with 2 or more VMs: **99.95%** connectivity.
- Single VM (no availability set): typically 99.9% with Premium SSD, but varies.