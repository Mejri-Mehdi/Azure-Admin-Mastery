# Management Group Hierarchy

```text

Tenant Root Group (Built-in)
│
└── MG-Root
    │
    ├── MG-Production
    │   
    │
    └── MG-NonProduction
                └── Subscription (Currently here)

```

- **MG-Root**: Top‑level management group for all subscriptions.
- **MG-Production**: For production workloads, stricter policies.
- **MG-NonProduction**: For development, testing, sandbox.

## Subscription Movement
- Initially moved subscription to `MG-NonProduction` to test location policy.
- Then moved to `MG-Production` to test inheritance from `MG-Root`.

---
![alt text](<Screenshot 2026-07-17 210631.png>)
