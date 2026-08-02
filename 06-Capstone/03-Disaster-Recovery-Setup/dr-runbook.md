# Disaster Recovery Runbook

## Overview
This runbook covers the procedures to failover and failback all three tiers (VM, storage, SQL) from East US to West US2.

## Pre‑requisites
- ASR replication is healthy for `vm-dr-primary`.
- Storage account `stgdrprimaryxyz123` is GRS and synchronised.
- SQL database `db-dr` has a geo‑replica in West US2.
- All operations are performed by an administrator with Owner/Contributor permissions.

## Failover Scenarios

### Planned Failover (zero data loss)
Use when you have advance warning of a regional outage.

#### 1. SQL Database
```powershell
az sql db replica set-primary `
  --resource-group rg-dr-secondary `
  --server sql-dr-secondary `
  --name db-dr
```

This promotes the secondary to primary. Update application connection strings to point to sql-dr-secondary.database.windows.net.

#### 2. Storage Account (GRS)
In the portal, go to the storage account → Geo‑replication → Prepare for failover.
Verify the last sync time. Click Failover. The secondary region becomes the new primary.
Update any application references to the storage endpoints (the name remains the same, but DNS is redirected).

#### 3. Virtual Machine (ASR)
In the ASR vault, go to Replicated items → select vm-dr-primary.
Click Planned failover.
Choose the latest recovery point (zero data loss). The source VM will be shut down, and a new VM will be created in West US2.
After the failover completes, start the VM and validate the application.

### Unplanned Failover (potential data loss)
When the primary region is unavailable unexpectedly.
SQL: Force failover with --allow-data-loss:

```powershell
az sql db replica set-primary --resource-group rg-dr-secondary --server sql-dr-secondary --name db-dr --allow-data-loss
```

Storage: Initiate customer‑managed failover from the portal. Some recent writes may be lost.
VM: In ASR, run Unplanned failover. Select the latest recovery point (may not be crash‑consistent if recent changes weren't replicated).

### Failback Procedure
After the primary region is restored:

For SQL: Reverse geo‑replication back to the original primary server.

For Storage: The now‑primary (former secondary) is LRS after failover. Re‑enable GRS or move data back to the original region.

For VM: In ASR, Re‑protect the failed‑over VM to replicate back to East US. Then perform a planned failover to return to the primary region.