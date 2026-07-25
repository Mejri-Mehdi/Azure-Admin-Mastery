# Deployment Slot Configuration

## App Service: `myslotsapp2026xyz`
- **Plan**: `asp-slots` (Standard S1)
- **Production slot**: URL `https://myslotsapp2026xyz.azurewebsites.net`
- **Staging slot**: URL `https://myslotsapp2026xyz-staging.azurewebsites.net`

## App Settings
| Setting Name | Type | Value | Swappable? |
|--------------|------|-------|-------------|
| `Environment` | Non‑slot (default) | `ProductionEnv` | Yes (swaps with slot) |
| `SlotName`    | Slot‑sticky           | `StagingOnly`  | No (remains in staging) |

## Swap Behaviour
- **Pre‑swap**: Production served “Hello Production v1”; Staging served “Hello Staging v2”.
- **Post‑swap**: Production served “Hello Staging v2”; Staging served “Hello Production v1”.
- The slot‑sticky setting `SlotName` stayed on the staging slot; the non‑sticky `Environment` moved with the slot content.