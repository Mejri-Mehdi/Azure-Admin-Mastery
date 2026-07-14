# Azure Naming Convention

## Overview
This naming convention follows Microsoft’s Cloud Adoption Framework (CAF) recommendations. It ensures consistency, automation readiness, and easy identification of resources by environment, application, region, and instance.

## General Format
`[resource-type]-[environment]-[application]-[region]-[instance]`

- **resource-type**: Short prefix indicating the Azure service (rg, vm, vnet, nsg, st, etc.)
- **environment**: prod, dev, sbx, test, staging
- **application**: Short name of the workload or app (e.g., hr, finance, portal)
- **region**: 3-letter Azure region abbreviation (see table)
- **instance**: 3-digit number, starting with 001

## Resource-Specific Patterns

| Resource Type | Pattern                                       | Notes                                                                   |
|---------------|-----------------------------------------------|-------------------------------------------------------------------------|
| Resource Group| `rg-<env>-<app>-<region>-<nnn>`               | Hyphens allowed; used for logical grouping                              |
| Virtual Machine | `vm-<env>-<app>-<nnn>`                      | Name max 15 chars (Windows) or 64 (Linux); we omit region to save space |
| Storage Account | `st<env><app><region><nnn>`                 | **No hyphens, lowercase only, 3-24 chars, globally unique**             |
| Virtual Network | `vnet-<env>-<app>-<region>-<nnn>`           | Max 64 chars                                                            |
| Network Security Group | `nsg-<env>-<app>-<region>-<nnn>`     | Max 80 chars                                                            |
| Subnet        | `snet-<env>-<app>-<region>-<nnn>`             | Max 80 chars; often added in VNet context                               |

## Abbreviations

### Environment Codes
| Environment | Code |
|-------------|------|
| Production  | prod |
| Development | dev  |
| Sandbox     | sbx  |

### Azure Region Abbreviations
| Region         | Code |
|----------------|------|
| East US        | eus  |
| West Europe    | weu  |
| France Central | frc  |

(Expand as needed per your global footprint.)

## Special Rules for Storage Accounts
- Storage account names **must be globally unique** because they participate in DNS: `<name>.blob.core.windows.net`.
- Only lowercase letters and numbers are allowed; **no hyphens, underscores, or uppercase**.
- Length must be between 3 and 24 characters.
- To achieve uniqueness, consider adding a random suffix or a short org identifier (e.g., `stdevhrweu001` may need `stdevhrweu001x5`).

## Tagging (companion strategy)
While naming identifies the purpose, tags are used for cost and governance. At minimum apply:
- `Environment` = Production/Development/Sandbox
- `CostCenter` = IT-xxx
- `Owner` = email address

## Enforcement
Azure Policy can be used to enforce naming patterns for resources that support it (e.g., resource groups, VMs). For storage accounts, a policy can at least enforce the lowercase and length constraints.

## Resource Group
Pattern: `rg-<env>-<app>-<region>-<nnn>`  
Example: `rg-prod-app01-eus-001`

## Virtual Machine
Pattern: `vm-<env>-<app>-<nnn>`  
Example: `vm-dev-app01-002`

## Storage Account
Pattern: `st<env><app><region><nnn>`  
Rules: lowercase only, no hyphens, 3–24 chars, globally unique.  
Example: `stprodapp01eus001`

## Virtual Network
Pattern: `vnet-<env>-<app>-<region>-<nnn>`  
Example: `vnet-sbx-test-weu-003`

## Network Security Group
Pattern: `nsg-<env>-<app>-<region>-<nnn>`  
Example: `nsg-prod-app01-eus-001`

---

## Region Abbreviations
- eastus → eus  
- westeurope → weu  
- centralus → cus  
- japaneast → jpe  

---

## Notes
- Storage accounts follow stricter rules due to DNS naming constraints.  
- Consistency enables automation, policy enforcement, and easier resource discovery.