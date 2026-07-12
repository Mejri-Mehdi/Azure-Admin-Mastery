# Azure PowerShell (Az Module) Setup

## Overview
This project documents the installation and usage of the Azure PowerShell Az module.  
It highlights authentication, subscription management, resource operations, and comparison with Azure CLI.

---

## Steps Completed
1. Installed Az module via `Install-Module`.  
2. Authenticated with `Connect-AzAccount`.  
3. Listed subscriptions and noted details.  
4. Set active subscription context.  
5. Listed resource groups in table format.  
6. Queried VM status (Name, PowerState).  
7. Compared PowerShell object output with Azure CLI JSON/text output.

---

## Key Concepts
- **PowerShell Objects** → Rich, structured output for automation.  
- **Az Module** → Modern replacement for AzureRM.  
- **CLI vs PowerShell** → CLI is lightweight and text‑based; PowerShell is object‑oriented and better for complex logic.  

---

## Deliverables
- **setup.md** → Installation and environment documentation.  
- **commands.ps1** → Commands with inline comments.  
- **comparison.md** → CLI vs PowerShell comparison table.  

---

## Lessons Learned
- PowerShell integrates deeply with automation workflows.  
- CLI is faster for quick tasks, but PowerShell excels in scripting pipelines.  
- Understanding both tools provides flexibility in DevSecOps and cloud operations.  

---

## Next Steps
- Explore resource creation (`New-AzResourceGroup`, `New-AzVM`).  
- Automate deployments with PowerShell scripts.  
- Combine CLI and PowerShell for hybrid workflows.
