# Azure Advisor Recommendations by Pillar

## Cost
1. **Right‑size underutilized virtual machines** – VM `locktest-vm` is running at low CPU; resize to smaller SKU to save ~50%.
2. **Buy reserved instances** – For consistently running VMs, 1‑year reservation can save up to 72%.
3. **Delete idle load balancers** – An unused load balancer was detected; deletion would eliminate charges.

## Security
1. **Enable soft delete for storage accounts** – Soft delete protects against accidental data loss; applies to blob service.
2. **Apply Just‑In‑Time VM access** – Reduces attack surface by opening ports only when needed.
3. **MFA should be enabled on accounts with owner permissions** – Enforce multi‑factor authentication for privileged roles.

## Reliability
1. **Configure disaster recovery for virtual machines** – Replicate critical VMs to another region using Azure Site Recovery.
2. **Enable backup for virtual machines** – Ensure Recovery Services vaults are configured with retention policies.
3. **Configure availability zones for public IP addresses** – Use zone‑redundant IPs for higher resilience.

## Operational Excellence
1. **Delete old snapshots** – Unused snapshots consume storage costs.
2. **Update Azure Monitor agent** – Use Azure Monitor Agent instead of legacy agents.
3. **Enable diagnostics settings** – Collect logs and metrics for better troubleshooting.

## Performance
1. **Use managed disks instead of unmanaged** – Improve VM reliability and performance.
2. **Enable Accelerated Networking** – For supported VM sizes, it reduces latency.
3. **Upgrade to the latest generation of VMs** – For better price‑performance ratio.

*Note: These recommendations are based on Advisor scans of my subscription. Actual list may vary.*