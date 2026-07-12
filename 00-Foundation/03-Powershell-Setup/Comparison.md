# Azure CLI vs PowerShell Comparison

| Operation                          | Azure CLI Command                                              | PowerShell Command                                      |
|-----------------------------------|-----------------------------------------------------------------|---------------------------------------------------------|
| Login                              | `az login`                                                     | `Connect-AzAccount`                                     |
| List subscriptions                 | `az account list --output table`                               | `Get-AzSubscription | Select Name, Id, State`           |
| Set subscription                   | `az account set --subscription "Sub-Name"`                     | `Set-AzContext -Subscription "Sub-Name"`                |
| List resource groups               | `az group list --output table`                                 | `Get-AzResourceGroup | Format-Table`                    |
| List VMs with status               | `az vm list -d --query "[].{Name:name,PowerState:powerState}"` | `Get-AzVM -Status | Select Name, PowerState`            |
| Show account info                  | `az account show`                                              | `Get-AzContext`                                         |
| Configure defaults                 | `az configure --defaults group=rg location=eastus`             | `$PSDefaultParameterValues["*:ResourceGroupName"]="rg"` |
| List VM SKUs                       | `az vm list-skus --location eastus --size Standard_B`          | `Get-AzComputeResourceSku -Location eastus`             |
| Show CLI version                   | `az --version`                                                 | `Get-Module Az`                                         |
| Extensions / Modules               | `az extension list`                                            | `Get-InstalledModule Az*`                               |

---

## Notes
- **CLI** → JSON/text output, good for quick scripting.  
- **PowerShell** → Object‑based output, better for complex automation.  
- **Az module** is the modern replacement for AzureRM.
