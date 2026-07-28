# Service Endpoint vs. Private Endpoint

| Feature | Service Endpoint | Private Endpoint |
|--------|------------------|------------------|
| **Access method** | Storage still uses its public IP; traffic comes from VNet via Azure backbone. | Storage gets a private IP in your VNet; all traffic stays private. |
| **Network security** | Firewall rules based on VNet/subnet identity. | Complete isolation – public access can be disabled entirely. |
| **DNS** | No DNS change; storage resolves to public IP. | Private DNS zone overrides resolution to private IP within VNet. |
| **Cost** | Free | ~$0.01/hour per endpoint + data processing |
| **Use case** | Simple, cost‑effective restriction of PaaS to specific VNets. | Highest security, compliance, or when public internet must be completely excluded. |
| **Traffic path** | Over Azure backbone, but terminates at public endpoint. | Entirely within Azure backbone and VNet, terminating at private IP. |

## Our Lab Results
- **Service endpoint**: VM accessed storage via public endpoint, but firewall allowed based on subnet. Local machine blocked.
- **Private endpoint**: Storage FQDN resolved to private IP; public access disabled, VM still accessed via private IP, local machine completely blocked.

Both methods restrict access, but private endpoints provide the highest level of isolation.