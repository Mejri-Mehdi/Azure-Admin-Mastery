# Azure RBAC Built-in Roles

## Core Roles

| Role | Capabilities |
|------|--------------|
| **Owner** | Full management access (create, delete, modify resources) **plus** the ability to assign roles to other users. Can manage billing for subscriptions. |
| **Contributor** | Full management access (create, delete, modify) but **cannot** assign roles or manage permissions. |
| **Reader** | Can view all resources, but cannot make any changes. |
| **User Access Administrator** | Can **only** manage user access (assign roles), but cannot manage resources themselves. Often used by security teams. |

## Scope and Inheritance
- **Subscription**: Role applies to all resource groups and resources in the subscription.
- **Resource Group**: Role applies to that group and all child resources.
- **Resource**: Role applies only to that specific resource.
- Roles are **inherited** from higher scopes (e.g., Subscription → RG → Resource).

## Built‑in vs. Custom Roles
- Azure provides >120 built-in roles for specific services (e.g., `Virtual Machine Contributor`, `Storage Blob Data Reader`).
- Custom roles can be created if fine‑grained permissions are needed.

## Testing Principle
Always verify least privilege: give users only the permissions they need. Our test proved that `Contributor` cannot assign roles, and `Virtual Machine Contributor` cannot create storage accounts.

## License
RBAC (role‑based access control) is a free feature of Azure Active Directory (Entra ID) and does not require a premium license.

## Overview
This project demonstrates assigning and testing **Azure RBAC built-in roles** at different scopes.  
It covers Owner, Contributor, Reader, and specialized roles like VM Contributor and Storage Blob Data Reader.

---

## Steps Completed
1. Created resource group `rg-rbac-lab`.  
2. Assigned built-in roles to 5 users at RG and resource scopes.  
3. Logged in as each user to test capabilities.  
4. Verified role assignments and deny assignments in IAM.  

---

## Key Concepts
- **Owner** → Full access + can assign roles.  
- **Contributor** → Full access, cannot assign roles.  
- **Reader** → View-only access.  
- **User Access Administrator** → Can assign roles only (requires Global Admin).  
- **Inheritance** → Roles assigned at subscription flow down to RG and resources.  

---

## Deliverables
- **rbac-matrix.md** → User × Scope × Role matrix.  
- **testing-results.md** → Documented user capabilities.  
- **README.md** → Explanation of built-in roles.  

---

## Lessons Learned
- RBAC roles define least privilege access.  
- Scope matters: subscription → RG → resource.  
- Specialized roles (VM Contributor, Storage Blob Data Reader) provide granular control.  

---

## Next Steps
- Explore **custom RBAC roles** for fine-grained permissions.  
- Test **scope inheritance** across subscription and RG.  
- Integrate RBAC with **Azure Policy** for governance.