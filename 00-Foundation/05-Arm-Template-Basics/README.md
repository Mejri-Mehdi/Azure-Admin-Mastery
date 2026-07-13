# ARM Template Structure

Every ARM template contains the following main sections:

| Section           | Description                                                                                                                        |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------|
| `$schema`         | Defines the version of the template language and the deployment scope (resource group, subscription, management group, or tenant). |
| `contentVersion`  | A version string for the template (you control it).                                                                                |
| `parameters`      | Input values that can be provided at deployment time. They make the template reusable.                                             |
| `variables`       | Internal values that are computed once and can be reused throughout the template. They reduce repetition.                          |
| `resources`       | The Azure resources to deploy or update. This is the core of the template.                                                         |
| `outputs`         | Values returned after deployment, often used to pass information to other templates or scripts.                                    |

**`dependsOn`** is an important property inside resources that controls the order of deployment.  
Functions like `resourceGroup().location`, `reference()`, and `resourceId()` are used to refer to runtime properties and existing resources.

## Deployment Scopes
- **Resource Group**: `az deployment group create` – targets a specific resource group.
- **Subscription**: `az deployment sub create` – can create resource groups, assign policies, etc.
- **Management Group / Tenant**: Higher scopes for centralised governance.

## Overview
This project demonstrates deploying Azure resources using **raw ARM JSON templates**.  
It covers resource group and storage account deployments at both resource group and subscription scopes.

---

## Steps Completed
1. Exported a resource group template from the Azure Portal.  
2. Studied the JSON structure: `$schema`, `contentVersion`, `parameters`, `variables`, `resources`, `outputs`.  
3. Cleaned template to include only a storage account.  
4. Added `dependsOn` property for practice.  
5. Deployed at resource group scope (`template.json`).  
6. Deployed at subscription scope (`rg-template.json`).  

---

## Key Concepts
- **Declarative & Idempotent** → ARM templates describe desired state; re-running doesn’t duplicate resources.  
- **Deployment Scopes** → Resource Group, Subscription, Management Group, Tenant.  
- **dependsOn** → Controls deployment order between resources.  
- **reference() Function** → Retrieves runtime properties of deployed resources.  

---

## Deliverables
- **template.json** → Resource group scope storage account deployment.  
- **rg-template.json** → Subscription scope resource group deployment.  
- **deploy.sh** → Deployment commands.  
- **README.md** → Documentation and explanation.  

---

## Lessons Learned
- ARM templates are powerful but verbose compared to Bicep.  
- Understanding scopes is critical for correct deployments.  
- `dependsOn` ensures proper sequencing when resources depend on each other.  
- `reference()` enables dynamic outputs like endpoints.  

---

## Next Steps
- Add variables for naming conventions.  
- Explore linked templates for modular deployments.  
- Transition to **Bicep** for more concise authoring while still compiling to ARM JSON.