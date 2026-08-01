# User‑Defined Routes Configuration

## Route Tables
- **rt-spoke1** (associated with `snet-workload` in Spoke 1)
- **rt-spoke2** (associated with `snet-workload` in Spoke 2)

## Route
| Route Name | Address Prefix | Next Hop Type | Next Hop IP | Purpose |
|------------|----------------|---------------|-------------|---------|
| default-to-nva | 0.0.0.0/0 | VirtualAppliance | `<NVA private IP>` | Force all internet traffic through the NVA in the hub |

## NVA
- VM `vm-nva` in `snet-nva` with IP forwarding enabled.
- In a production environment, the NVA would run a firewall or proxy to inspect traffic.