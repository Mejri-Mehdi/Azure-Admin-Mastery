# Infrastructure as Code – Bicep Module Portfolio

This portfolio contains reusable Bicep modules for provisioning standard Azure infrastructure components. Each module is self‑contained and parameterised, making it easy to compose different environments (dev, test, prod) via a main orchestration file and parameter files.

## Module Library
| Module | File | Description |
|--------|------|-------------|
| Network | `modules/network.bicep` | VNet, subnets, optional NSGs. |
| Compute | `modules/compute.bicep` | Virtual machine (Windows/Linux), NIC, OS disk. |
| Storage | `modules/storage.bicep` | Storage account with private endpoint. |
| Monitoring | `modules/monitoring.bicep` | Log Analytics workspace and a CPU metric alert. |

## Orchestration
`main.bicep` wires the modules together:
- Creates a network with a web subnet (NSG allows HTTP).
- Deploys a Windows VM in the web subnet.
- Creates a storage account with private endpoint in the app subnet.
- Sets up a Log Analytics workspace and a CPU alert for the VM.

## Environment‑Specific Deployments
Parameter files (`.bicepparam`) override the `environment` and sizing parameters:

- **Dev** (`main.dev.bicepparam`): `Standard_B2s`, standard settings.
- **Prod** (`main.prod.bicepparam`): `Standard_D2s_v3`, production defaults.

Deploy with:
```powershell
az deployment group create `
  --resource-group rg-iac-dev `
  --template-file main.bicep `
  --parameters main.bicepparam
```

## Benefits
- **Reusability** → Modules can be reused across projects.  
- **Consistency** → Same architecture deployed in dev, test, prod.  
- **Governance** → Tags and policies enforced via parameters.  
- **Scalability** → Easy to extend with new modules.  

## Sreenshots

---
![alt text](<Screenshot 2026-08-02 112455.png>)
---
![alt text](<Screenshot 2026-08-02 112509.png>)
---
![alt text](<Screenshot 2026-08-02 112516.png>)
---

## Lessons Learned
- Modular design simplifies IaC maintenance.  
- Parameter files separate configuration from code.  
- Bicep improves readability compared to raw ARM templates.  