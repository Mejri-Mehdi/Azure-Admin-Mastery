# Guest User Invitation Flow

## 1. Invitation Sent
- Admin invited `guesttester@gmail.com` via Microsoft Entra ID → Users → Invite external user.
- Invitation email generated and sent to the guest's inbox.

---
![alt text](<Screenshot 2026-07-15 151322.png>)
---

## 2. Invitation Accepted
- Guest opened email from "Microsoft Invitations" and clicked **Accept invitation**.
- Signed in with Google credentials.
- Permissions consent page accepted.
- Guest now appears in the tenant's user list.

---
![alt text](<Screenshot 2026-07-15 151612.png>)
---

## 3. Guest Properties
- **User type**: Guest
- **Source**: External Azure Active Directory (Google)
- **UPN**: `guesttester_gmail.com#EXT#@<tenant>.onmicrosoft.com`
- **Member of**: SG-Developers (added after creation)

## 4. Access Test
- Guest logged into Azure portal via incognito browser.
- **Result**: No resources visible. "All resources" list is empty.
- Guest has no RBAC roles assigned — access is fully restricted by default.

## 5. Key Observations
- Guest accounts are automatically created with limited directory read permissions.
- RBAC must be explicitly granted for any Azure resource access.
- The guest's identity is federated through their home identity provider (Google).