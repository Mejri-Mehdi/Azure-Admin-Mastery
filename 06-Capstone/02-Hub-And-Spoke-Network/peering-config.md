# VNet Peering Configuration

## Peerings
| Name | Source VNet | Remote VNet | Allow Virtual Network Access | Allow Gateway Transit | Use Remote Gateways |
|------|-------------|-------------|------------------------------|-----------------------|----------------------|
| hub-to-spoke1 | vnet-hub | vnet-spoke1-prod | Yes | Yes | No |
| spoke1-to-hub | vnet-spoke1-prod | vnet-hub | Yes | No | Yes |
| hub-to-spoke2 | vnet-hub | vnet-spoke2-dev | Yes | Yes | No |
| spoke2-to-hub | vnet-spoke2-dev | vnet-hub | Yes | No | Yes |

## Gateway Transit
- **Hub** allows gateway transit, meaning its VPN gateway can be used by peered VNets.
- **Spokes** have `useRemoteGateways` = true, enabling them to route on‑premises traffic through the hub's gateway.

## Non‑Transitivity
- Spoke 1 and Spoke 2 are not directly peered. They can communicate through the hub if the NVA forwards traffic between them (routing must be configured).