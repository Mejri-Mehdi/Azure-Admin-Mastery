# Failover and Secondary Read Tests

## RA‑GRS Secondary Read Test
- **Account**: `ragrsdemoxyz123`
- **Secondary Blob Endpoint**: `https://ragrsdemoxyz123-secondary.blob.core.windows.net/`
- **Procedure**: Uploaded `testblob.dat` to the primary, then attempted to download using the secondary endpoint with the account key.
- **Result**: ✅ Successfully read the blob from the secondary region (West US) after a short replication delay (~5 minutes).

## GRS (non‑RA) Read Attempt
- **Account**: `grsdemoxyz123`
- **Procedure**: Tried to access the secondary endpoint (same URL pattern but no `-secondary`) — connection refused or authentication error.
- **Result**: ❌ The secondary endpoint is **not accessible** until a failover is initiated.

## Failover Simulation (Documented)
- **GRS failover**:
  1. In the portal, navigate to the GRS storage account → **Geo‑replication** → **Prepare for failover**.
  2. Confirm the secondary region and start the process.
  3. After failover, the DNS records switch, the former secondary becomes the new primary (LRS), and the original primary becomes read‑only (if still available).
  4. The storage account’s SKU remains **Standard_LRS** after failover; you must manually re‑enable geo‑replication later.

## Observed Replication Latency
- For GRS/RA‑GRS, blobs typically replicate to the secondary region within a few minutes. Our test blob (10 MB) was available on the secondary for RA‑GRS after ~3 minutes.