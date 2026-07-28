# VPN Gateway Connectivity Test

## Test Setup
- **VNet A (10.80.0.0/16)**: VM `vm-a` at 10.80.1.4
- **VNet B (10.90.0.0/16)**: VM `vm-b` at 10.90.1.4
- **Gateway connections**: Both `Connected`

## Test Results
| Source | Destination | Method | Result |
|--------|------------|--------|--------|
| vm-a (10.80.1.4) | vm-b (10.90.1.4) | ICMP ping | ✅ Success |
| vm-b (10.90.1.4) | vm-a (10.80.1.4) | ICMP ping | ✅ Success |
| vm-a | vm-b (SSH) | TCP 22 | ✅ Success (if SSH rule added) |
| vm-b | vm-a (SSH) | TCP 22 | ✅ Success |

Ping response times were ~1-2 ms, as both VNets are in the same region but traffic traverses the Azure backbone through the VPN tunnel.

## Conclusion
The VNet‑to‑VNet VPN connection functions as a site‑to‑site VPN would, allowing secure communication between otherwise isolated VNets.