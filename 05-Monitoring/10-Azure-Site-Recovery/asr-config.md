# Azure Site Recovery Configuration

## Source Environment
- **Region**: East US
- **VM**: `vm-win-bk` (Windows Server 2022)
- **Vault for replication**: `rsv-asr-dr` (West US2)

## Target Environment
- **Region**: West US2
- **Resource Group**: `rg-asr-target`
- **Virtual Network**: `vnet-asr-target` (10.200.0.0/16)
- **Replication Policy**: Default (5‑min crash‑consistent, 4‑hour app‑consistent, 24‑hour retention)

## Replication Status
- Initial replication completed.
- Recovery points available: (list from portal)

## Test Failover Setup
- **Test VNet**: `vnet-test-failover` (10.201.0.0/24)
- **Test VM**: `<source-vm>-test` created during test failover.