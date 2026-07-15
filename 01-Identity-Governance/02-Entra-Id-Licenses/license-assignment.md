# License Assignment

## 1. Available Licenses

---
![alt text](<Screenshot 2026-07-15 150225.png>)
---

*Viewed in Entra ID → Licenses → All products. Shows available vs assigned counts.*

## 2. Direct Assignment to user1
- Assigned Microsoft 365 E3 to user1 via the M365 Admin Center.
- Navigated to admin.microsoft.com → Users → Active users → user1 → Licenses and apps.
- Checked the license and saved.
- Verified: user1 → Licenses shows the direct assignment.

## 3. Group-Based Licensing — Attempt & Limitation

### Attempt
- Went to Entra ID → Licenses → All products → selected a license → clicked "Assign" → searched for SG-IT-Admins.
- Received error 401:
  **"You need a Microsoft Entra ID Premium license to use this feature."**

---
![alt text](<Screenshot 2026-07-15 150252.png>)
---

### Why It Failed
Group-based licensing requires **Microsoft Entra ID P1 or P2**. The current tenant has Azure AD Free / M365 E3, which do not include this feature.

### Expected Behaviour (with P1/P2)
If P1/P2 were active:
1. Assign license to **SG-IT-Admins** → all current and future members get it automatically.
2. Add **user2** to the group → license appears on user2 within 5–15 minutes, marked "Inherited from SG-IT-Admins".
3. Remove **user2** from the group → license is automatically removed from user2.

This automation eliminates manual license management for growing teams.

## 4. License Usage
| Product         | Total | Assigned | Available |
|-----------------|-------|----------|-----------|
| Microsoft 365 E3| 0     | 0        | 3         |