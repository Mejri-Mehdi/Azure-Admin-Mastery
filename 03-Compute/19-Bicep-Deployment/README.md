# Bicep Deployment from ARM Template

## Process
1. **Decompiled** the modified ARM template (`arm-template.json`) using `az bicep decompile`.
2. **Cleaned up** the raw Bicep output: removed redundant variables, improved naming, and split into reusable modules.
3. **Modularized** networking (VNet, NSG, public IP) and compute (NIC, VM) into separate Bicep files for better organization.
4. **Created a parameter file** (`main.bicepparam`) to pass values during deployment.
5. **Deployed** using `az deployment group create` with the Bicep template.
6. **Exported** the resulting ARM template to compare with the original.

## Decompilation Limitations
- `az bicep decompile` does not always produce perfect, idiomatic Bicep code. It may use `any()` functions for complex expressions, leave unnecessary `split()` calls, or miss opportunities for simplification.
- Manual cleanup is often required to make the Bicep template modular, add type safety, and use Bicep-specific features like `@secure()`, `@minLength()`, and `output` with module references.
- The decompiled output is a great starting point, but expect to refine it.

## What We Changed
- Removed auto‑generated names and replaced with variables.
- Added explicit `dependsOn` where needed (though Bicep often infers dependencies).
- Split into modules: networking and compute, each with their own outputs.
- Used `@secure()` for the admin password to prevent logging.
- Added a `.bicepparam` file for cleaner parameter management.

## Deployment
```powershell
az deployment group create -g rg-bicep-deploy --template-file main.bicep --parameters vmName=bicep-mod-vm adminUsername=azureadmin adminPassword="Password123!"
```

## Screenshots

---
![alt text](<Screenshot 2026-07-25 192530.png>)
---
![alt text](<Screenshot 2026-07-25 192552.png>)
---
![alt text](<Screenshot 2026-07-25 193311.png>)
---
![alt text](<Screenshot 2026-07-25 193318.png>)
---
![alt text](<Screenshot 2026-07-25 194303.png>)
---
![alt text](<Screenshot 2026-07-25 202140.png>)
---
![alt text](<Screenshot 2026-07-25 202200.png>)
---

## Lessons Learned
- Decompilation is a starting point, not a perfect conversion.  
- Bicep modules improve readability and reusability.  
- Parameter files separate configuration from code.  
- Exporting back to ARM JSON validates correctness.  