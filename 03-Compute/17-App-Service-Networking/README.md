# App Service Networking: VNet Integration vs Private Endpoint

## Key Differences
| Feature | VNet Integration | Private Endpoint |
|---------|------------------|------------------|
| **Direction** | Outbound (app → VNet) | Inbound (client → app via private IP) |
| **Purpose** | Access resources inside the VNet (databases, VMs) | Expose the app to the VNet privately, block internet |
| **App's IP** | Uses the app’s outbound addresses, routed through the VNet | App gets a private IP in the VNet, DNS resolves to it |
| **Security** | VNet resources are reachable; app is still publicly exposed | App is isolated from the internet; only VNet‑connected clients can reach it |
| **Requires** | Standard+ plan, subnet delegation | Standard+ plan, private DNS zone |
| **Use case** | Your app needs to call an internal API or database | You want to completely block public internet access |

## Access Restrictions
Access Restrictions are inbound IP firewalls that control which public IPs can reach the public endpoint of the app. They work at the App Service front‑end, before traffic reaches your code.

## Our Lab Setup
1. Created a VNet with subnets for integration, private endpoint, and a test VM.
2. Enabled outbound VNet integration – the app could fetch content from the VM’s private IP.
3. Added a Private Endpoint, which assigned a private IP to the app and allowed access only from within the VNet after disabling public access.
4. Applied Access Restrictions to demonstrate IP whitelisting.

## Best Practice
- Use **VNet integration** when you need to reach VNet‑hosted services from your app.
- Use **Private Endpoint** to lock down inbound access completely.
- Combine with **Access Restrictions** for defense‑in‑depth.

