# 01-Identity & Governance: Azure Governance Foundation

This section covers identity, access management, policy enforcement, and cost governance in Azure. You built a complete governance framework – from user lifecycle and RBAC to resource locks, management groups, and budgets.

## Modules Overview

| Module | Folder | What You Built |
|--------|--------|----------------|
| **01 – Entra ID Users & Groups** | `01-entra-id-users-groups/` | Created 5 users, 3 groups (Security, dynamic, Microsoft 365), assigned licenses, tested sign‑in block and soft‑delete recovery. |
| **02 – Entra ID Licenses** | `02-entra-id-licenses/` | Explored license management; assigned licenses directly and attempted group‑based licensing, documenting the Entra ID P1/P2 requirement. |
| **03 – External Users (Guest Access)** | `03-external-users-guest-access/` | Invited an external user (B2B), configured guest access restrictions, added them to a group, and verified zero-standing-access in the portal. |
| **04 – SSPR Configuration** | `04-sspr-configuration/` | Configured Self‑Service Password Reset for a pilot group; documented the user registration and password reset flow. Noted P1/P2 licensing requirement. |
| **05 – RBAC Built‑in Roles** | `05-rbac-built-in-roles/` | Assigned Owner, Contributor, Reader, VM Contributor, and Storage Blob Data Reader at different scopes, then tested each user’s actual permissions. |
| **06 – RBAC Custom Roles** | `06-rbac-custom-roles/` | Created a custom role allowing VM restart and storage account read; assigned it to a user and validated the exact allowed/denied operations. |
| **07 – RBAC Scope Inheritance** | `07-rbac-scope-inheritance/` | Assigned Reader at subscription, Contributor at RG, Owner at VM level; moved a VM to another RG to observe loss of access, proving scope inheritance. |
| **08 – Azure Policy & Initiatives** | `08-azure-policy-initiatives/` | Assigned tag and location policies, created an initiative combining three policies, and tested deny effects and compliance dashboards. |
| **09 – Resource Locks** | `09-resource-locks/` | Applied Delete and ReadOnly locks on a VM; documented which operations are allowed/blocked. Tested lock inheritance from the resource group. |
| **10 – Tags & Tag Policies** | `10-tags-and-tag-policies/` | Enforced tag inheritance from RG, required valid Environment and Owner tags, tested deny effects, and demonstrated CLI queries for tagged resources. |
| **11 – Management Groups** | `11-management-groups/` | Created a management group hierarchy (MG-Root → Prod/NonProd), moved a subscription, assigned policies at different levels, and tested policy inheritance. |
| **12 – Budgets & Alerts** | `12-budgets-and-alerts/` | Created a $20 subscription budget with 50/80/100% alerts, a $5 RG budget, an anomaly detection alert, and documented Advisor cost recommendations. |
| **13 – Azure Advisor** | `13-azure-advisor/` | Reviewed all five Advisor pillars (Cost, Security, Reliability, Operational Excellence, Performance), documented top recommendations, applied a Quick Fix, and configured security alerts. |

## Key Governance Concepts Learned

- **Identity**: User lifecycle, guest B2B, group types (Security vs M365, assigned vs dynamic), license management, SSPR.
- **Access Control**: RBAC built‑in and custom roles, scope inheritance, resource‑level permissions, separation of Owner/Contributor/Reader.
- **Policy & Compliance**: Azure Policy (definitions, assignments, initiatives), deny/audit effects, compliance dashboards, tag enforcement.
- **Resource Protection**: Delete and ReadOnly locks, lock inheritance, who can manage locks.
- **Hierarchy**: Management groups, subscription placement, inherited policies across the hierarchy.
- **Cost Governance**: Budgets, action groups, anomaly alerts, Advisor recommendations, cost analysis.

## Licensing Notes (Real‑world Constraints Encountered)

- **Entra ID P1/P2** is required for: group‑based licensing, group‑based SSPR, dynamic groups.  
  (You chose to save the trial for later and instead documented the features and expected behavior.)
- RBAC, resource locks, Azure Policy, management groups, budgets, and Advisor are all available with a standard Azure subscription (no premium license needed).

This identity & governance baseline ensures that before deploying any workload, you have proper user management, least‑privilege access, policy guardrails, and cost controls in place.