
### B. `connectivity-test.md`
```markdown
# Connectivity Test Results

**Blob URL**: `https://stfwxyz123.blob.core.windows.net/test/test.html`

| Source                  | Firewall State                | Result | Details |
|-------------------------|-------------------------------|--------|---------|
| Local machine (browser) | All networks (public access)  | ✅ Works | HTML returned |
| VM (curl)               | All networks (public access)  | ✅ Works | Internet egress from VM |
| Local machine           | Selected: VNet + my IP        | ✅ Works | IP whitelisted |
| VM                      | Selected: VNet + my IP        | ✅ Works | VNet service endpoint trusted |
| Local machine           | Selected: VNet only (IP removed) | ❌ Denied | `403 This request is not authorized to perform this operation.` |
| VM                      | Selected: VNet only           | ✅ Works | VNet rule still applies |

## Observations
- When **IP rule was removed**, local browser access failed immediately (after propagation).
- The VM continued to access the blob via the Azure backbone; its traffic never left the Microsoft network.
- The storage account container is set to public access level "Blob" for anonymous read, but the firewall still enforces network-level restrictions.