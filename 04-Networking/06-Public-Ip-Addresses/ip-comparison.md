# Public IP SKU Comparison: Basic vs Standard

| Feature                       | Basic SKU                            | Standard SKU                          |
|-------------------------------|--------------------------------------|---------------------------------------|
| **Allocation method**         | Dynamic or Static                    | Static only                           |
| **Availability Zones**        | Not supported                        | Supported (zonal or zone‑redundant)    |
| **Security**                  | No NSG enforcement; open by default (requires careful configuration) | Requires NSG; inbound traffic must be explicitly allowed |
| **Load balancer support**     | Basic load balancer only             | Standard load balancer, cross‑region  |
| **Routing preference**        | Microsoft network only               | Choose Microsoft network or Internet routing |
| **IP version**                | IPv4, IPv6 (Dynamic only)            | IPv4, IPv6 (Static only)              |
| **Resource reliability**      | Not zone‑resilient                    | Zone‑redundant option provides higher availability |
| **Use case**                  | Legacy applications, non‑production  | Production workloads, any new deployment |

## Important Notes
- **Basic SKU is being retired**; it may not be available in all regions for new deployments. Azure recommends Standard for all new workloads.
- **Standard SKU public IPs must be protected by a Network Security Group**. The VM creation command automatically adds an NSG to the NIC or subnet, which satisfies this requirement.
- **Public IP Prefix** is only available with Standard SKU. It allows you to reserve a contiguous range of IPs for whitelisting or consistency.