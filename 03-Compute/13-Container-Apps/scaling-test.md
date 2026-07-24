# Container Apps Auto‑Scaling Test

## Setup
- Container App: `nginx-app`
- Scale rule: HTTP concurrent requests > 10 → increase by 1
- Min replicas: 0, max replicas: 5

## Test Execution
- Used `hey` tool: `hey -n 2000 -c 20 http://<fqdn>/`
- This sustained 20 concurrent connections for ~20 seconds.

## Observations
| Time | Replica Count | Note |
|------|---------------|------|
| Before test | 0 (idle) | App scaled to zero when no traffic |
| During load | 3 replicas active | Scaled up within ~1 minute |
| After 5 min idle | 0 replicas | Scaled back to zero |

- The KEDA HTTP scaler monitored the average concurrent requests per replica.
- As concurrency exceeded 10, new replicas were provisioned until the load was distributed below the threshold or max limit reached.

## Conclusion
Azure Container Apps successfully auto‑scaled based on HTTP concurrency. The scaling was fast (tens of seconds) and the app remained responsive. After the load stopped, it gracefully scaled back to zero, eliminating costs when not in use.