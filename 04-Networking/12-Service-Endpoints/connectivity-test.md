# Service Endpoint Connectivity Test

## Test 1: From VM inside the VNet
- **Command**: `curl -s "https://storsvcxyz123.blob.core.windows.net/data/test.txt?<SAS>"`
- **Result**: ✅ `Service endpoint test`
- **Explanation**: Traffic flows through the Azure backbone because the subnet has a service endpoint for `Microsoft.Storage`. The storage firewall allows the subnet.

## Test 2: From local machine (outside VNet)
- **Command**: `Invoke-WebRequest -Uri "https://storsvcxyz123.blob.core.windows.net/data/test.txt?<SAS>"`
- **Result**: ❌ `403 This request is not authorized …` or connection timeout
- **Explanation**: The source IP is the public internet. The storage firewall’s default action is Deny, and no IP rule allows our local IP. The service endpoint is irrelevant for internet‑originating traffic.

## Conclusion
Service endpoints successfully restrict storage access to only the designated subnet, while maintaining optimal routing for internal traffic.