# Azure CLI Setup

## Overview
This project documents the installation, authentication, and configuration of the Azure CLI.  
It demonstrates subscription management, resource group operations, default settings, and extension discovery.

---

## Steps Completed
1. Installed Azure CLI locally on Windows 10.  
2. Ran `az login` → authenticated via device code flow.  
3. Listed subscriptions with `az account list` → noted `isDefault` flag.  
4. Set active subscription using `az account set --subscription "Your-Sub-Name"`.  
5. Listed resource groups in table format.  
6. Configured defaults for resource group and location (`eastus`).  
7. Queried VM SKUs in East US (`Standard_B` family).  
8. Verified CLI version and documented installed extensions.

---

## Key Concepts
- **Azure CLI Idempotency** → Most create operations can be safely re-run without duplication.  
- **Defaults via `az configure`** → Reduce repetitive typing by setting group and location.  
- **Extensions** → Add specialized functionality (e.g., VM Scale Sets, Container Apps).  
- **Device Code Flow** → Secure authentication method for CLI login.  

---

## Deliverables
- **setup.md** → OS details and installation steps.  
- **commands.sh** → All executed commands with comments.  
- **output.txt** → Sanitized subscription list output.  

---

## Lessons Learned
- CLI provides a **scriptable alternative** to the Azure Portal.  
- Subscription and resource group context is critical for accurate operations.  
- Defaults streamline workflows and reduce errors.  
- Extensions expand CLI capabilities beyond core commands.  

---

## Next Steps
- Explore resource creation (`az group create`, `az vm create`).  
- Automate workflows with shell scripts.  
- Investigate advanced extensions (e.g., `az containerapp`, `az vmss`).  
