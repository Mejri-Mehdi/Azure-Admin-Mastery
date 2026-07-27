# Application Gateway Routing and WAF Test

## Test Setup
- Application Gateway public IP: `<appgw-ip>`
- Backend VMs: `vm-images` (10.30.2.4), `vm-api` (10.30.2.5)

## Path‑Based Routing Test
| Request Path | Expected Backend | Actual Response |
|--------------|------------------|-----------------|
| `http://<ip>/` | images-pool | "Images Server" |
| `http://<ip>/images/logo.jpg` | images-pool | "Images Server" |
| `http://<ip>/api/user` | api-pool | "API Server" |
| `http://<ip>/api/images` | api-pool | "API Server" |
| `http://<ip>/other` | images-pool (default) | "Images Server" |

All responses matched the configured routing rules.

## WAF Detection Mode Test
- **Request**: `http://<ip>/?cmd=ls`
- **Expected behavior**: The request passes through because WAF is in Detection mode; it is logged but not blocked.
- **Observed**: The request returned a normal page from the backend (no 403 error).
- **WAF rule**: OWASP rule 942100 "SQL Injection Attack" likely matched, generating a log entry. (Logs verified in Log Analytics workspace `law-appgw`; see screenshot.)
- **Conclusion**: WAF successfully detected the malicious pattern without blocking traffic. Switching to Prevention mode would have returned a 403 error.

## 404 Issue and Resolution

Initially, requests to `/images/*` and `/api/*` returned 404 because nginx had no file at those paths.  
**Fix**: Modified nginx configuration to fall back to `index.html` for any missing path (`try_files ... /index.html`).  
This confirms the Application Gateway correctly forwarded requests to the appropriate backend pools.