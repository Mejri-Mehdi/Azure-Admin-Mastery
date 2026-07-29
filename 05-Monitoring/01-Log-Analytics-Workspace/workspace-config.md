# Log Analytics Workspace Configuration

**Workspace**: `law-central`  
**Resource Group**: `rg-monitor`  
**Region**: East US  
**Pricing Tier**: Pay‑as‑you‑go (`PerGB2018`) – you pay per GB ingested, with 30 days default retention.  
**Retention**: Increased to **90 days**.  

## Retention Options
- Default: 30 days (free).
- Can be extended up to 730 days (2 years) with additional cost.
- Data can also be exported to Azure Storage for long‑term archival.

## Workspace ID and Keys
- `workspaceID`: (from `az monitor log-analytics workspace show --query customerId`)
- Not needed directly for AMA; agents authenticate via managed identity or workspace key.

## Data Ingestion
- Data is ingested from connected sources via Data Collection Rules.
- Ingestion charges apply per GB (first 5 GB/month free).
- Daily cap can be set to control costs.