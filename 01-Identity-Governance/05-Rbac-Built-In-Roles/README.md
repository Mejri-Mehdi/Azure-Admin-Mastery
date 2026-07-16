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