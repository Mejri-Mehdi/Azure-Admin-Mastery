# Tagging Strategy

## Purpose
Tags are key‑value metadata pairs used to logically organize, track costs, and manage Azure resources at scale. A consistent tagging strategy is critical for governance, automation, and billing transparency.

## Required Tags
We enforce three foundational tags on all resource groups (and eventually on individual resources via policy):

| Tag Name    | Purpose                                      | Example Values                            |
|-------------|----------------------------------------------|-------------------------------------------|
| Environment | Indicates the workload’s life‑cycle stage    | Production, Development, Sandbox, Staging |
| CostCenter  | Maps resource spend to a financial department| IT-001, IT-002, IT-003                    |
| Owner       | Identifies the team or individual responsible| admin@contoso.com, devteam@contoso.com    |

## Implementation
1. **Resource groups** are created with tags using the Azure CLI (`--tags` parameter).
2. A custom Azure Policy (`tag-policy.json`) will deny the creation of any resource group missing the required tags.
3. For resources inside a group, we recommend extending the policy to resources or using Azure Policy’s “inherit” feature from resource groups (via policy effects like `modify` or `append`).

## Operations
- **Query**: `az group list --tag Environment=Production` quickly finds production groups.
- **Move**: Resources can be moved between groups, but tags on the resource group do **not** automatically inherit to child resources. The moved resource retains its own tags.
- **Locks**: A `ReadOnly` lock on the production resource group prevents accidental deletions or modifications.

## Future Enhancements
- Apply the tag policy at the subscription level.
- Use Azure Policy to auto‑append missing tags from the resource group to child resources.
- Integrate with Azure Cost Management for cost analysis filtered by tags.

## Overview
This project demonstrates applying a **tagging strategy** across multiple resource groups.  
It includes cost-center, environment, and owner tags, resource movement, locks, and subscription-level policies.

---

## Steps Completed
1. Created 3 resource groups with tags:
   - `rg-prod-app01` → Production, IT-001, admin@contoso.com  
   - `rg-dev-app01` → Development, IT-002, dev@contoso.com  
   - `rg-sandbox-test` → Sandbox, IT-003, tester@contoso.com  
2. Queried RGs by tag (`Environment=Production`).  
3. Moved a resource from dev RG to prod RG (portal + CLI).  
4. Applied a **ReadOnly lock** on `rg-prod-app01`.  
5. Defined a subscription-level policy requiring tags.

---

## Key Concepts
- **Tags** → Metadata (name-value pairs, max 50 per resource).  
- **Resource Movement** → Some resources cannot move between RGs (limitations apply).  
- **Locks** → Prevent accidental deletion/modification (`ReadOnly`, `CanNotDelete`).  
- **Tag Inheritance** → Tags are not inherited from RG to resources unless enforced by policy.  
- **Policy** → Ensures compliance by requiring tags at subscription scope.

---

## Deliverables
- **create-rgs.sh** → Script to create RGs with tags.  
- **tag-policy.json** → Policy definition requiring tags.  
- **README.md** → Documentation of tagging strategy.  
- **screenshots/move-resource.png** → Portal screenshot of resource move blade.  

---

## Lessons Learned
- Tags improve **cost tracking, ownership, and environment clarity**.  
- Locks safeguard critical RGs from accidental changes.  
- Policies enforce governance at scale.  
- Resource movement has limitations (e.g., certain services cannot move).  

---

## Next Steps
- Automate tagging with **Azure Policy assignments**.  
- Explore **management group scope** for enterprise governance.  
- Integrate tags into **cost analysis and reporting**.

---

## Screenshots

![alt text](<Screenshot 2026-07-14 200226.png>) 
---
![alt text](<Screenshot 2026-07-14 200311.png>)
---
![alt text](<Screenshot 2026-07-14 200536.png>) 
---
![alt text](<Screenshot 2026-07-14 200550.png>)