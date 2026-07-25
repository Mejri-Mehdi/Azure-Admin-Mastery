# App Service Networking Configuration

## VNet: `vnet-app` (10.5.0.0/16)
| Subnet | Address Prefix | Purpose | Delegation |
|--------|---------------|---------|------------|
| snet-vm | 10.5.1.0/24 | Test VM | None |
| snet-integration | 10.5.2.0/24 | Outbound VNet integration | Microsoft.Web/serverFarms |
| snet-privateendpoint | 10.5.3.0/24 | Private Endpoint | None (private endpoint network policies disabled) |

## Web App: `webapp-net2026xyz`
- **Plan**: `asp-networking` (Standard S1, Linux)
- **VNet integration**: Outbound via `snet-integration` – app can reach private IPs in the VNet.
- **Private Endpoint**: `pe-webapp` in `snet-privateendpoint` – DNS resolves to a private IP; public access can be disabled.
- **Access Restrictions**: `AllowMyIP` rule allowing only a specific public IP.

## Test VM: `vm-test`
- **Image**: Ubuntu 22.04, private IP `10.5.1.4`
- **Web server**: Python HTTP server on port 80 (for VNet integration test).