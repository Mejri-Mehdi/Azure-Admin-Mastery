# Azure Policy & Initiatives

## What is Azure Policy?
Azure Policy enforces organizational standards and assesses compliance at scale. It can deny, audit, or modify resources.

## Key Components
- **Policy Definition**: The rule itself (e.g., "require a tag", "allow only certain regions").
- **Initiative**: A collection of policy definitions grouped together for a common goal (e.g., "Secure Baseline").
- **Assignment**: The act of applying a policy or initiative to a specific scope (management group, subscription, resource group).

## How It Works
1. You assign a policy to a scope.
2. New resources are evaluated at creation time (denial if non‑compliant).
3. Existing resources are evaluated periodically (every 24 hours by default, but you can trigger on‑demand scans).
4. Non‑compliant resources appear in the Compliance dashboard.

## Our Setup
- **Direct assignments**:  
  - `Require a tag on resource groups` to enforce `CostCenter` tag.  
  - `Allowed locations` to restrict resource deployment to `eastus` and `westus2`.
- **Initiative**:  
  - `Secure Baseline Initiative` combines the above two policies plus `VMs should have backup configured` (audit) into one assignment for easier management.

## Testing Outcomes
- Creating a resource group without the `CostCenter` tag → **denied** (non‑compliant, then compliant after remediated).
- Deploying a VM in `westeurope` → **denied** by location policy.
- The initiative provides a single compliance view for all three policies.

## Why Use Initiatives?
- Logical grouping for related policies (e.g., all security baseline policies).
- One assignment, one compliance report.
- Easier to audit and manage than dozens of individual policy assignments.

## Screenshots

---
![alt text](<Screenshot 2026-07-16 213040.png>)
---
![alt text](<Screenshot 2026-07-16 213634.png>)
---
![alt text](<Screenshot 2026-07-16 215521.png>)
---

## Steps Completed
1. Assigned built-in policy requiring CostCenter tag.  
2. Tested compliance by creating RGs with/without tags.  
3. Assigned allowed locations policy (eastus, westus2).  
4. Verified denial when deploying VM in westeurope.  
5. Assigned VM backup policy.  
6. Created Secure Baseline Initiative combining all three policies.  
7. Viewed compliance dashboard.  

---

## Key Concepts
- **Policy Definition** → The rule (e.g., require tag).  
- **Initiative** → Collection of policies grouped together.  
- **Assignment** → Scope where the policy/initiative applies (subscription, RG, resource).  
- **Remediation** → Fixing non-compliant resources.  
- **Evaluation** → Policies are evaluated asynchronously (15–30 minutes).  