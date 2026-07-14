# 00-Foundation: Core Azure Setup & Governance 

This section establishes the essential tooling, identity, governance, and knowledge baseline for an Azure environment.

## What We Built

| Module                          | Folder | Outcome |
|---------------------------------|--------------------------------------------------------------------------------------|---------|
| **01 – Portal Navigation**      | `01-azure-portal-navigation/`       | Documented portal layout, pinned key services to the dashboard, used Cloud Shell (Bash & PowerShell), and explored the Resource Visualizer. |
| **02 – Azure CLI Setup**        | `02-azure-cli-setup/`                 | Installed Azure CLI, authenticated via device code, set defaults, queried resources, and produced a sanitized output of `az account list`. |
| **03 – PowerShell Setup**       | `03-powershell-setup/`               | Installed the Az module, connected to Azure, ran management cmdlets, and compared PowerShell objects vs. CLI text output. |
| **04 – Bicep Basics**           | `04-bicep-basics/`                       | Created a Bicep template for a storage account, deployed it, compiled to ARM JSON, and explained the Bicep advantage. |
| **05 – ARM Template Basics** | `05-arm-template-basics/`         | Exported a portal template, cleaned it to a reusable ARM JSON, added `dependsOn`, deployed at resource group and subscription scope, and documented the 6 ARM template sections. |
| **06 – Resource Groups & Tags** | `06-resource-groups-and-tags/` | Created three tagged RGs (prod/dev/sandbox), moved a resource, applied a ReadOnly lock, and authored a custom policy requiring tags. |
| **07 – Cost Management** | `07-cost-management-basics/`          | Created a $10 budget with an 80% email alert via Action Group, viewed cost by resource group/service, explored Advisor recommendations. |
| **08 – Naming Conventions** | `08-naming-conventions/`           | Defined a CAF-aligned naming standard with abbreviation tables, resource-specific patterns, and 20 real-world examples. |

## Key Concepts Covered
- **Management Plane**: All portal actions, CLI, and PowerShell calls go through Azure Resource Manager.
- **Idempotency**: CLI/PowerShell create commands are idempotent; ARM templates are declarative.
- **Declarative IaC**: Bicep compiles to ARM JSON, enabling versioned, repeatable deployments.
- **Governance**: Tags, resource locks, and policies enforce standards and prevent accidents.
- **Cost Control**: Budgets and alerts proactively manage spend; Advisor suggests optimisations.
- **Naming & Consistency**: A well-defined naming convention simplifies automation, security, and billing.

This foundation prepares you for higher-level workloads, networking, and security configurations.
