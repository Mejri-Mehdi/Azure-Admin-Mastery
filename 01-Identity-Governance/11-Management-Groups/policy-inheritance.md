# Policy Inheritance Documentation

## Policies Assigned
- **MG-NonProduction**: `Allowed locations` = `eastus` only.
- **MG-Root**: `Require a tag on resource groups` (tag name = `CostCenter`).

## Inheritance Testing

### 1. Subscription under MG-NonProduction
- **Location restriction**: Attempt to create resource in `westus2` → **denied**.  
  Resource in `eastus` → **allowed**.
- **Tag requirement**: None directly on MG-NonProduction, but if a policy is later added to MG-Root, it would inherit.

### 2. Subscription moved to MG-Production
- MG-Production has no direct policy assignment (yet).
- **Inherited from MG-Root**: The `CostCenter` tag policy now applies.
- Testing:
  - Create resource group without `CostCenter` → **denied**.
  - Create resource group with `CostCenter=IT-005` → **allowed**.

### 3. Policy Flow
- Management group policies flow **downward**:  
  `Tenant Root Group → MG-Root → MG-Production → Subscription → Resource Group → Resource`
- A policy assigned at `MG-Root` applies to all child management groups and subscriptions.

## Key Takeaways
- Policies assigned at a higher management group are inherited automatically by all descendant scopes.
- You can override a policy with a more restrictive one at a lower level, but you cannot remove an inherited policy without an exemption.
- Moving a subscription between management groups changes the set of inherited policies immediately.