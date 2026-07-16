# SSPR Configuration (Simulated)

## Enablement Attempt
- Navigated to **Entra ID → Password reset → Properties**.
- Selected **Selected** and chose **SG-IT-Admins** as the pilot group.
- **Error**: *"You need a Microsoft Entra ID Premium license to use this feature."*

---
![alt text](<Screenshot 2026-07-16 140247.png>)
---

**What this means:** Group-based SSPR requires Entra ID P1 or P2 per user. Without it, only the “All users” option is available. In a production environment, you would assign P1 licenses to the pilot group first, then complete the enablement.

## Configuration Settings (intended)
| Setting | Value |
|---------|-------|
| Enabled for | SG-IT-Admins (pilot) |
| Authentication methods | Mobile phone, Email, Security questions |
| Methods required to reset | 2 |
| Questions required to register | 3 |
| Require registration at sign-in | Yes |
| Password writeback | Not configured (requires hybrid setup + P1/P2) |

# SSPR Configuration Steps

1. Enabled SSPR for SG-IT-Admins (pilot group).
2. Configured authentication methods:
   - Mobile phone
   - Email
   - Security questions
3. Required 2 methods to reset.
4. Required 3 security questions to register.
5. Registration enforced for users.
