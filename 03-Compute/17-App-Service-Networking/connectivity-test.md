# Connectivity Test Results

## Outbound VNet Integration
- **From Web App** to VM private IP (`10.5.1.4:80`): Success – web page displays “Hello from the VM”.
- **Without VNet integration**: App cannot reach the private IP; connection times out.

## Private Endpoint (inbound)
- **From VM** to `webapp-net2026xyz.azurewebsites.net` (after private endpoint creation):
  - DNS resolved to `10.5.3.x` (private IP).
  - HTTPS request succeeded, returned the same content (proxied from VM).
- **Public access disabled**: Public endpoint returns 403 or times out; private endpoint still works.

## Access Restrictions
- **Before rule**: Public endpoint accessible from any IP.
- **After adding `AllowMyIP` rule**: Access from the allowed IP works; access from any other IP is denied (403).

## Summary
- VNet integration enables outbound traffic to VNet‑hosted resources.
- Private Endpoint provides a private inbound route, eliminating internet exposure.
- Access Restrictions allow fine‑grained IP whitelisting for public endpoints.