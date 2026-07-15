# Entra ID Users & Groups

## Security Groups vs Microsoft 365 Groups

| Feature | Security Group | Microsoft 365 Group |
|---------|----------------|---------------------|
| **Purpose** | Grant access to resources (applications, devices, SharePoint on-prem, Azure RBAC) | Enable collaboration via Teams, SharePoint, Outlook, Planner, etc. |
| **Membership** | Users, service principals, devices | Users only (plus external guests) |
| **Creation** | In Entra ID portal or via PowerShell/CLI | Also can be created from Teams, Outlook, SharePoint |
| **Group‑aware apps** | Azure AD, Windows AD, third‑party apps that support security groups | Microsoft 365 apps (Teams, Outlook, SharePoint, Yammer, etc.) |
| **Mailbox** | No | Yes (shared mailbox) |
| **Dynamic membership** | Yes (requires Entra ID P1/P2) | Yes (same licensing requirement) |
| **Nesting** | Can be a member of other security groups | Cannot be nested in other M365 groups |

**When to use which:**
- Use a **Security Group** to control access: e.g., assign Azure RBAC role “Virtual Machine Contributor” to SG-IT-Admins.
- Use a **Microsoft 365 Group** when you need a team site, shared mailbox, and collaboration tools together.

## Licensing for Dynamic Groups
Dynamic membership requires **Microsoft Entra ID P1 or P2** license for each unique user who is a member of the dynamic group.

## Soft‑Delete Behavior
Deleted users remain in the **Deleted users** container for 30 days. During this period, you can restore them with all their attributes, group memberships, and licenses intact.

## Overview
This project demonstrates a complete **user lifecycle** in Microsoft Entra ID.  
It covers user creation, license assignment, group membership, dynamic rules, blocking sign-in, and soft delete recovery.

---

## Steps Completed
1. Created 5 users with different licenses.  
2. Created 3 groups:  
   - Security Group (Assigned)  
   - Security Group (Dynamic)  
   - Microsoft 365 Group  
3. Added users to groups (assigned and dynamic).  
4. Blocked sign-in for user5.  
5. Deleted user5 and recovered from Deleted Users.  

---

## Key Concepts
- **Security Groups** → Used for resource access control.  
- **Microsoft 365 Groups** → Used for collaboration (Teams, SharePoint, Outlook).  
- **Dynamic Groups** → Automatically include users based on rules (requires Entra ID P1/P2).  
- **Deleted Users** → Stay in recycle bin for 30 days before permanent deletion.  

---

## Deliverables
- **users.csv** → List of created users and properties.  
- **groups.md** → Group types and membership rules.  
- **README.md** → Documentation of differences between Security Groups and Microsoft 365 Groups.  
- **screenshots/move-resource.png** → Portal screenshot of resource move blade (optional).  

---

## Lessons Learned
- Security Groups are best for **access control**.  
- Microsoft 365 Groups are best for **collaboration**.  
- Dynamic membership reduces manual administration.  
- Soft delete ensures recoverability of user accounts.  

---

## Next Steps
- Automate user provisioning with **PowerShell or Graph API**.  
- Apply **Conditional Access policies** for governance.  
- Explore **Access Reviews** for periodic group membership validation.