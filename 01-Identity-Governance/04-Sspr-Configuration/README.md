# Self-Service Password Reset (SSPR)

## What is SSPR?
SSPR allows users to change or reset their password without contacting IT, reducing help desk calls.

## Licensing Requirements
- **All users** method: Available with Azure AD Free.  
- **Group‑based targeting** (our pilot): Requires **Microsoft Entra ID P1 or P2** for each user in the pilot group.  
- **Password writeback**: Additionally requires Entra ID P1/P2 and a hybrid identity setup.

## Why SSPR Matters
- **70% reduction** in password‑related help desk tickets.
- Users can reset from anywhere, 24/7.
- Reduces downtime and improves security by enforcing authentication methods.

## Password Writeback
- Synchronises password changes from Azure AD to on‑premises Active Directory.
- Enables a single password across cloud and on‑premises.
- Requires Microsoft Entra Connect (or Cloud Sync) and outbound internet access from the on‑premises DC.
- Use case: An on‑premises user forgets password → resets in cloud → new password works for on‑premises login immediately.

## Best Practices
- Always pilot SSPR with a small group before rolling out to everyone.
- Require at least **2 authentication methods** for reset.
- Force users to register at next sign‑in to ensure coverage.
- Use security questions that are not easily guessable (e.g., “First pet’s name” is better than “Mother’s maiden name”).

## Our Configuration
| Setting | Value |
|---------|-------|
| Enabled for | SG-IT-Admins (pilot) |
| Authentication methods | Mobile, Email, Security questions |
| Methods required | 2 |
| Questions required | 3 |
| Registration forced | Yes |

## Overview
This project demonstrates enabling and testing **Self-Service Password Reset (SSPR)** in Microsoft Entra ID.  
It covers configuration, registration, reset flow, and password writeback concepts.

---

## Steps Completed
1. Enabled SSPR for SG-IT-Admins (pilot group).  
2. Configured multiple authentication methods.  
3. Set reset requirements (2 methods, 3 questions).  
4. Enforced registration for users.  
5. Tested reset flow with user1.  
6. Reviewed password writeback concept for hybrid environments.  

---

## Key Concepts
- **SSPR Scope** → Can be enabled for all users or specific groups.  
- **Authentication Methods** → Multiple options increase security.  
- **Password Writeback** → Requires Entra Connect/Cloud Sync for hybrid AD.  
- **Licensing** → Group-based SSPR requires Entra ID P1/P2.  
- **Impact** → Reduces help desk tickets by ~70%.  

---

## Deliverables
- **sspr-config.md** → Step-by-step configuration.  
- **user-experience.md** → Screenshots and reset flow documentation.  
- **README.md** → Explanation of SSPR requirements and password writeback.  

---

## Lessons Learned
- SSPR improves user autonomy and reduces IT overhead.  
- Proper configuration ensures security and compliance.  
- Password writeback is critical for hybrid identity scenarios.  

---

## Next Steps
- Expand SSPR to all users.  
- Integrate with Conditional Access policies.  
- Monitor usage and audit reset events in **Azure AD logs**.