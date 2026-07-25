# App Service Plan Tier Comparison

| Feature | Free (F1) | Basic (B1) | Standard (S1) | Premium (P1v2) |
|---------|-----------|------------|---------------|-----------------|
| **SLA** | None | 99.95% | 99.95% | 99.95% |
| **Custom domains** | ❌ | ✅ | ✅ | ✅ |
| **SSL bindings** | ❌ | ✅ SNI only | ✅ SNI + IP SSL | ✅ SNI + IP SSL |
| **Auto‑scale** | ❌ | ❌ | ❌ | ✅ (rule‑based) |
| **Deployment slots** | ❌ | ❌ | ✅ (up to 5) | ✅ (up to 20) |
| **Backup & restore** | ❌ | ✅ (manual) | ✅ (manual) | ✅ (automated) |
| **Max instances** | 1 (shared) | 3 | 10 | 20 |
| **Private endpoints** | ❌ | ❌ | ❌ | ✅ (with VNet integration) |
| **Storage** | 1 GB | 10 GB | 50 GB | 250 GB |
| **Daily data quota** | 165 MB | Unlimited | Unlimited | Unlimited |
| **Use case** | Dev/test | Low‑traffic production | Production with staging | High‑scale, premium features |

**Key takeaway**: Choose the tier that matches your need for custom domains, scaling, staging slots, and security. Multiple apps can share a single plan to reduce costs.