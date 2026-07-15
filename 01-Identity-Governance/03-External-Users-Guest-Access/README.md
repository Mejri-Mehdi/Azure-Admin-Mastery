# External Identities: B2B vs B2C

## Azure AD B2B (Business-to-Business)
- **Purpose**: Invite external partners, vendors, or contractors to access your organisation's apps and resources.
- **Identity**: Guest uses their **existing** identity (Gmail, another Entra tenant, etc.).
- **Authentication**: Handled by the guest's home identity provider.
- **User object**: Created in your Entra ID as a **Guest** user type.
- **Access control**: RBAC, Conditional Access, group memberships.
- **Typical use case**: A freelancer needs access to your project's SharePoint site.

## Azure AD B2C (Business-to-Consumer)
- **Purpose**: Build customer-facing apps with custom sign-up/sign-in flows.
- **Identity**: Users can sign up with **local accounts** (username/password) or **social providers** (Google, Facebook, etc.).
- **Authentication**: Managed entirely within the B2C tenant.
- **User object**: Stored in a **separate B2C directory** (not your corporate Entra ID).
- **Typical use case**: An e-commerce app where millions of customers create accounts.

## Key Differences

| Feature | B2B | B2C |
|---------|-----|-----|
| **Directory** | Same corporate Entra ID | Separate B2C tenant |
| **User type** | Guest users | Local/social accounts |
| **Identity providers** | Bring-your-own identity | Customisable (Google, FB, local, etc.) |
| **Access to internal apps** | Yes (with RBAC) | No (isolated) |
| **Scale** | Hundreds/thousands | Millions |
| **Pricing** | Free up to 50K MAU (Monthly Active Users) | Premium tiers per MAU |
| **Custom branding** | Limited | Fully customisable login pages |

## What We Demonstrated
- **B2B invitation flow**: Invited a personal Gmail account, accepted, and appeared as a guest.
- **Guest access settings**: Configured limited directory access (default).
- **Cross-tenant access**: Default policies allow B2B collaboration.
- **Zero standing access**: Guest sees nothing in Azure until RBAC is assigned.

## Overview
This project demonstrates inviting external users into Microsoft Entra ID and configuring guest access settings.  
It covers guest invitation, group membership, RBAC testing, and cross-tenant access review.

---

## Steps Completed
1. Invited an external Gmail user as a guest.  
2. Accepted invitation and verified guest in tenant.  
3. Configured guest access settings (limited vs same access).  
4. Added guest to SG-Developers.  
5. Tested guest access in Azure portal (no visibility without RBAC).  
6. Reviewed cross-tenant access settings.  

---

## Key Concepts
- **Guest Users (B2B Collaboration)** → External identities added to your tenant for collaboration.  
- **B2C** → Consumer-facing identity solution (separate product).  
- **RBAC** → Guest users must be assigned roles to access resources.  
- **Cross-Tenant Access Settings** → Control inbound/outbound collaboration between tenants.  
- **Soft Governance** → Guest accounts can be restricted or expanded depending on policies.  

---

## Deliverables
- **guest-invite-flow.md** → Documented invitation flow.  
- **settings.md** → Guest access settings documentation.  
- **README.md** → Explanation of B2B vs B2C.  

---

## Lessons Learned
- Guest users are powerful for collaboration but must be governed carefully.  
- RBAC ensures least privilege access.  
- Cross-tenant settings provide control over external collaboration.  
- B2B and B2C serve different purposes: enterprise vs consumer identity.  

---

## Next Steps
- Automate guest invitations with **PowerShell or Graph API**.  
- Apply **Conditional Access policies** for guest accounts.  
- Periodically review guest accounts with **Access Reviews**.