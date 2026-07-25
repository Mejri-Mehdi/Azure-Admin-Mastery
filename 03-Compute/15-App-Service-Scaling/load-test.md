# Load Test and Autoscale Observation

## Setup
- App Service Plan: `asp-scale` (Standard S1, 1 instance initially)
- Web App: `webappscale2026xyz` (Node.js)
- CPU‑intensive endpoint: `/cpu` (5 seconds of busy‑wait per request)
- Autoscale rule: +1 instance when CPU > 70% for 10 minutes; -1 when CPU < 20% for 10 minutes.

## Load Generation
Used PowerShell background jobs to send 50 concurrent requests to the `/cpu` endpoint.
- Each request keeps one core busy for ~5 seconds.
- With 1 instance (1 core), CPU quickly reached 80-90%.

## Observed Scaling Behavior
| Time (after load started) | Instance Count | CPU (%) | Event |
|---------------------------|----------------|---------|-------|
| 0 min                     | 1              | 5%      | Idle |
| +2 min                    | 1              | 92%     | CPU spike detected |
| +12 min                   | 2              | 45%     | Scale‑out triggered |
| +30 min                   | 2              | 5%      | Load removed, CPU low |
| +42 min                   | 1              | 3%      | Scale‑in triggered |

## Validation
- Checked instance count via `az appservice plan show --query sku.capacity` and portal.
- Activity Log showed `Autoscale scale up initiated` and later `Autoscale scale down initiated` events.
- Application remained responsive throughout; scaling added capacity within 10 minutes of sustained high CPU.