# Azure Management Groups

## What Are Management Groups?
Management groups are logical containers that help you organize subscriptions and apply governance at scale. They sit above subscriptions in the Azure hierarchy.

## Hierarchy and Inheritance
- **Structure**: Root management group (built‑in) → custom management groups → subscriptions → resource groups → resources.
- **Policy & RBAC inheritance**: Any policy or role assignment applied at a management group level is automatically inherited by all child management groups, subscriptions, and resources.
- This allows central IT to enforce guardrails without having to touch each subscription individually.

## When to Use Management Groups
- **Multi‑subscription environments**: Large organizations with many subscriptions (e.g., one per department or environment) use management groups to organize them logically (Prod/Non‑Prod, Geo‑regions).
- **Centralized policy assignment**: Apply a “Require encryption” policy once at the root, and all subscriptions get it.
- **Budget and cost management**: Group subscriptions for cost reporting.
- **Access control**: Grant RBAC roles (e.g., `Security Reader`) to a whole set of subscriptions at once.

## Key Constraints
- A subscription can be a member of **only one** management group at a time.
- You can nest management groups up to **6 levels** deep (excluding the root and subscription).
- The Tenant Root Group is the top‑most level; you cannot delete it.
- You need **Management Group Contributor** role (or Global Admin with elevated access) to create and move management groups.

## How We Tested
- Created `MG-Root` with child groups `MG-Production` and `MG-NonProduction`.
- Assigned a location restriction policy to `MG-NonProduction` and verified it denied resources in `westus2`.
- Assigned a tag policy to `MG-Root` and moved the subscription to `MG-Production` – the tag policy was inherited, proving inheritance works across the hierarchy.

---
## Lessons Learned
- Management groups simplify governance across multiple subscriptions.  
- Policies applied at higher levels enforce consistency across environments.  
- Inheritance ensures compliance without repetitive assignments.  