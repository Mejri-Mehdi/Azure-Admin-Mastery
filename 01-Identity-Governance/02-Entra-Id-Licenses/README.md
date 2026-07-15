# Entra ID Licensing

## Direct vs Group-Based Licensing

| Aspect | Direct Assignment | Group-Based Assignment |
|--------|-------------------|------------------------|
| **How** | License assigned individually to each user | License assigned to a group; all members inherit it |
| **Management** | Manual per user | Automatic via group membership |
| **Scale** | Best for small teams or exceptions | Best for departments, roles, or large orgs |
| **License requirement** | Any Entra ID edition | **Requires Entra ID P1 or P2** |
| **Removal** | Must manually remove | Automatic when user leaves the group |

## What We Learned
- Direct assignment works immediately and requires no premium license.
- Group-based licensing is more efficient at scale but is a premium feature.
- The 401 error we encountered is a real-world governance check — you must plan licensing costs alongside feature adoption.
- In production, you would budget for P1/P2 if you need dynamic groups, group-based licensing, Conditional Access, or PIM.

## Key Takeaway
Always check the **licensing prerequisites** of Entra ID features before designing your identity strategy. The feature may appear in the portal but remain locked behind a premium SKU.

## Overview
This project demonstrates **license assignment** in Microsoft Entra ID, both directly to users and via group-based licensing.

## Lessons Learned
- Group-based licensing simplifies administration.  
- Direct assignment is useful for exceptions or small environments.  
- License usage monitoring ensures compliance and cost control.  

---

## Next Steps
- Automate license assignment with **PowerShell or Graph API**.  
- Use **Access Packages** for bundled license + group assignments.  
- Monitor license usage with **Cost Management + Billing**.