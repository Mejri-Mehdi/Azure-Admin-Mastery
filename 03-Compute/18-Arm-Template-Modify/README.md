# ARM Template Modification

## What We Did
1. Exported an ARM template from an existing VM deployment in the Azure portal.
2. Analyzed the original JSON to identify unnecessary resources and to understand the structure.
3. Cleaned up the template by removing extraneous resources (storage accounts, automatic extensions) while keeping the core VM, network, and disk.
4. Added a **parameter** `vmSize` with an allowed list, so the user can choose from specific sizes during deployment.
5. Added a **variable** `osDiskName` to derive the OS disk name from the VM name, making it consistent and reusable.
6. Added an **output** `nicId` that returns the resource ID of the network interface.
7. Ensured explicit **dependsOn** on the NIC for the VNet and public IP, making the deployment order obvious and reliable.
8. Validated the template with `az deployment group validate`.
9. Deployed the modified template to a new resource group using `az deployment group create`.

## Key Concepts Demonstrated
- **Parameters**: User‑supplied inputs that make the template reusable in different scenarios. `vmSize` has a default and allowed values.
- **Variables**: Internal placeholders that reduce repetition. `osDiskName` uses the `concat` function to combine the VM name with a suffix.
- **Outputs**: Values returned after deployment, useful for passing information to other templates or scripts. `nicId` can be used by subsequent deployments.
- **dependsOn**: Explicitly declares resource dependencies, ensuring the VNet and public IP exist before the NIC is created, and the NIC before the VM.

## Benefits of Template Modification
- Reduces complexity: only necessary resources are kept.
- Increases flexibility: new parameters allow different configurations without editing the template.
- Improves maintainability: variables centralize naming logic.
- Enables automation: outputs can be consumed by other Azure services or scripts.

## Screenshots

---
---
---
---
---
---

## Lessons Learned
- Exported templates often contain extra resources; cleaning improves clarity.  
- Parameters and variables make templates reusable.  
- Outputs provide useful runtime values.  
- `dependsOn` ensures correct deployment order.  