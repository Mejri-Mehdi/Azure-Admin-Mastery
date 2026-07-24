# ACR Geo‑Replication

## Purpose
Geo‑replication allows a single Azure Container Registry to serve images from multiple regions, reducing latency and providing regional redundancy.

## Implementation
- **Registry**: `myacrxyz123` (East US)
- **Replicated region**: West US 2
- **Command**: `az acr replication create --registry myacrxyz123 --location westus2`

## Verification
After replication, the registry is available in both regions. The fully qualified login server remains the same (`myacrxyz123.azurecr.io`); Azure automatically routes push/pull requests to the nearest replica (or you can use region‑specific endpoints).

## Notes
- Geo‑replication is available in **Standard** and **Premium** tiers.
- Each replica stores a full copy of the images.
- You can add up to 15 replicas (Premium) or 1 replica (Standard) beyond the home region.
- Replicas are billed separately per region.

## Our Setup
| Region | Type |
|--------|------|
| East US | Home registry |
| West US 2 | Replica |