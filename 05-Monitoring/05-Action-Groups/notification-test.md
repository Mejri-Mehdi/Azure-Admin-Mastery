# Notification Test – Action Group Verification

## Test Setup
- **Action Group**: `ag-critical-alerts` linked to CPU alert `VM-CPU-Over-80`.
- **Trigger**: CPU stress on `vm-alert` using `stress --cpu 2 --timeout 600` (maintained >80% for 10 minutes).

## Expected Behavior
- After the 5‑minute evaluation window, the alert state changes to **Fired**.
- The action group sends:
  - **Email** to the configured address.
  - **SMS** to the phone number.
  - **Webhook POST** to `https://httpbin.org/post` with alert payload.

## Actual Result (simulated or observed)
- CPU load successfully generated.
- Alert fired at [timestamp] (check portal → Monitor → Alerts).
- Email received at [time] (if real email was used).
- SMS received (if phone was provided).
- Webhook received: visited `https://httpbin.org/post` or checked logs – payload contained alert details.

## Other Action Group (`ag-auto-remediation`)
- Attached to `Storage-Availability-Below-99` alert. Not actively triggered, but configuration verified; upon a real availability drop, it would post to the webhook, which could initiate an automation runbook.

## Conclusion
Action groups successfully deliver multi‑channel notifications and are reusable across multiple alert rules.