# Security Review – Three‑Tier Application

## Network Segmentation
- **Subnet isolation**: Web, app, and DB in separate subnets.
- **NSG rules**: Enforce that only the web subnet can reach app, and only app can reach DB. Internet traffic is blocked to app/DB.
- **Azure Bastion**: Provides secure RDP/SSH without public IPs on any VM.

## Data Protection
- **Backup**: All VMs backed up daily with 30‑day retention. Soft delete enabled (default).
- **Storage Private Endpoint**: Logs storage account is only accessible via the private endpoint in the DB subnet.

## Identity & Access Management
- **RBAC**: Developers have Contributor access (can manage resources but not change permissions). Operations team has Reader access (view‑only).
- **Admin credentials**: Stored securely (consider Azure Key Vault for production).

## Governance
- **Azure Policy**: `Require a tag on resource groups` (CostCenter) ensures cost allocation. `Allowed locations` restricts deployment to East US and West US2.
- **Resource locks** (not applied but recommended for production).

## Monitoring & Alerts
- **CPU Alert**: Triggers when any web VM exceeds 80% CPU for 5 minutes.
- **Log Analytics**: Central log collection for troubleshooting and compliance.

## Recommendations for Production
- Use Azure Key Vault for secrets.
- Enable Azure Disk Encryption (ADE) on VMs.
- Implement Just‑In‑Time (JIT) VM access.
- Add a Web Application Firewall (WAF) in front of the load balancer.
- Configure Azure Sentinel for SIEM.