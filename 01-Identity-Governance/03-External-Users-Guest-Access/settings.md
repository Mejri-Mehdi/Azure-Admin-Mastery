# Guest Access Settings

## Configuration Chosen
- **Setting**: "Guest users have limited access to properties and memberships of directory objects"
- This is the **default and recommended** setting for security.

---
![alt text](<Screenshot 2026-07-15 153132.png>)
---

## What Limited Access Means
| Action | Allowed? |
|--------|----------|
| View other users in the directory | No (limited) |
| View group memberships of other users | No |
| View their own profile | Yes |
| View members of groups they belong to | Only if granted |
| Enumerate all users/groups | No |

## Alternative Setting
- **"Same access as members"** grants guests the same directory read permissions as regular members.
- Only use this for trusted partners or when necessary for collaboration.

## Cross-Tenant Access Settings

---
![alt text](<Screenshot 2026-07-15 155009.png>)
---

- Default policies allow B2B collaboration inbound and outbound.
- Organisational settings can override defaults for specific tenants.