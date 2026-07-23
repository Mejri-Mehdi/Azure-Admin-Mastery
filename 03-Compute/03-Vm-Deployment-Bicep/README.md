# VM Deployment via Bicep

## Template Structure
- **main.bicep**: Top‑level template. Defines the VNet, NSG, subnet, VM, and invokes the NIC module.
- **nic-module.bicep**: A reusable module that creates a public IP and NIC, returning the NIC ID and public IP address.

## Parameters
| Parameter | Description | Default |
|-----------|-------------|---------|
| `vmName` | Name of the virtual machine | Required |
| `adminUsername` | Local admin username | Required |
| `adminPassword` | Local admin password (secure) | Required |
| `vmSize` | VM size | `Standard_B2s` |
| `location` | Azure region | Resource group location |

## Outputs
- `vmId` – resource ID of the VM
- `publicIp` – assigned public IP address
- `privateIp` – private IP address of the NIC

## Why Use Bicep?
- **Simple syntax**: Cleaner than ARM JSON, less repetitive.
- **Modularity**: The NIC is encapsulated in its own module; you can reuse it in other templates.
- **Parameters & outputs**: Clearly define inputs and outputs, making the template reusable across environments.
- **Idempotency**: Deploying again with the same parameters will produce the same state (no duplicate resources).

## Key Bicep Concepts Demonstrated
- `param` with defaults, `@secure()` for passwords.
- `resource` declarations for VNet, NSG, subnet, VM.
- `module` to call a separate Bicep file and pass parameters.
- `output` to expose runtime properties (public IP, private IP).

## Deployment Commands
```powershell
# Using a parameter file
az deployment group create -g rg-compute-bicep --template-file main.bicep --parameters @parameters.json

# Inline parameters
az deployment group create -g rg-compute-bicep --template-file main.bicep --parameters vmName=test-vm2 adminUsername=azureadmin adminPassword="P@ssw0rd!" vmSize=Standard_B2ms
```

## Screenshot

---
![alt text](<Screenshot 2026-07-23 193633.png>)
---

## Lessons Learned
- Bicep simplifies ARM template authoring.  
- Parameters make templates reusable across environments.  
- Modules improve maintainability and reusability.  
