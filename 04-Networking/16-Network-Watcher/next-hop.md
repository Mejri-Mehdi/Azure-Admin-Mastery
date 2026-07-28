# Next Hop Results

| Source VM | Destination | Next Hop Type | Next Hop IP |
|-----------|-------------|---------------|-------------|
| vm-nw1 (10.100.1.4) | 8.8.8.8 | Internet | System route |
| vm-nw1 (10.100.1.4) | 10.100.1.5 (VM2) | VirtualNetwork | System route |

**Insight:** Next hop shows the Azure‑defined routing path. Traffic to the internet follows the default route; traffic within the VNet stays local. If a custom route table or NVAs were in place, the next hop would reflect that.