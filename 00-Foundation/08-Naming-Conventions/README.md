# Naming Conventions

## Overview
This project defines a **standardized naming convention** for Azure resources.  
It ensures consistency, compliance with resource constraints, and supports automation and governance.

---

## Steps Completed
1. Researched Microsoft’s Cloud Adoption Framework naming guidelines.  
2. Defined patterns for Resource Groups, VMs, Storage Accounts, VNets, and NSGs.  
3. Documented region abbreviations.  
4. Explained why storage accounts require stricter rules.  
5. Created examples to demonstrate the convention.

---

## Key Concepts
- **Storage Accounts** → Globally unique, DNS‑compatible, lowercase only.  
- **Consistency** → Enables automation, policy enforcement, and easier management.  
- **Region Abbreviations** → Short codes improve readability and reduce name length.  
- **Constraints** → Some resources enforce strict rules (length, characters, uniqueness).

---

## Deliverables
- **naming-convention.md** → Documented standard.  
- **examples.md** → 20 examples following the convention.  
- **README.md** → Explanation and rationale.

---

## Lessons Learned
- Storage accounts are the most restrictive resource type.  
- A clear convention prevents naming conflicts and improves governance.  
- Consistency across environments (prod, dev, sandbox) simplifies automation.  

---

## Next Steps
- Extend conventions to other resources (Key Vaults, App Services, Databases).  
- Automate enforcement with **Azure Policy**.  
- Integrate naming standards into CI/CD pipelines.
