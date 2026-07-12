---

## Deliverable 2: `commands.ps1`

A PowerShell script with every command you executed, commented.

**Example:**
```powershell
# 00-F03: PowerShell Az Module Setup – commands.ps1

# Install the Az module (requires admin or -Scope CurrentUser)
Install-Module -Name Az -AllowClobber -Force

# Import the module (optional, auto-loads)
Import-Module Az

# Authenticate to Azure (browser login)
Connect-AzAccount

# List all subscriptions
Get-AzSubscription | Select Name, Id, State

# Set working subscription (replace with your subscription name)
Set-AzContext -Subscription "Your-Subscription-Name"

# List resource groups
Get-AzResourceGroup | Format-Table

# Get all VMs and their power state
Get-AzVM -Status | Select Name, PowerState

# Check Az module version
Get-Module -Name Az -ListAvailable | Select Name, Version