# Availability Zones Deployment

## Region
East US 2 (supports Availability Zones)

## VMs Created
- **vm-zone1**: Zone 1, Standard_B2s, Windows Server 2022, IIS installed.
- **vm-zone2**: Zone 2, same configuration.

## Zone‑Redundant Load Balancer
- Public IP: `lb-zone-pip` – zone‑redundant (zones 1,2,3).
- Load Balancer: `lb-zone` (Standard SKU) with health probe on TCP 80.
- Both VMs added to backend pool.

## Validation
- Each VM’s zone confirmed via `az vm show`.
- Web request to load balancer IP returns different VM responses, proving traffic is distributed across zones.

## Key Points
- VMs must be deployed with `--zone` parameter.
- The load balancer frontend is zone‑redundant, so even if one zone fails, the IP remains reachable.
- The backend pool automatically spans zones; the health probe ensures traffic only goes to healthy VMs.