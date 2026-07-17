# Tags and Tag Policies

## Why Tags Matter
Tags are metadata (key‑value pairs) attached to Azure resources. They enable:
- **Cost allocation**: Filter and group costs by department, project, or environment in Cost Management.
- **Automation**: Run scripts against resources with a specific tag (e.g., shut down all VMs tagged `Environment=Development` at night).
- **Governance**: Use Azure Policy to enforce tagging standards across the organization.

## Our Tagging Strategy
We enforce three tags across all resources:
- **Environment** (Production, Development, Testing) – inherited from the resource group when possible.
- **CostCenter** (IT‑xxx) – required on resource groups.
- **Owner** (valid email) – required on all resources to identify the responsible person.

## Policy Enforcement
1. **Inherit a tag from the resource group** (BuiltIn, Append)  
   Automatically copies the `Environment` tag from the resource group to any new resource created inside it. Uses a managed identity with `Tag Contributor` role.

2. **Require Environment tag with allowed values** (Custom, Deny)  
   Denies resource creation if the `Environment` tag is missing or has an invalid value.

3. **Require Owner tag with email format** (Custom, Deny)  
   Denies resource creation if the `Owner` tag is missing or doesn't match a basic email pattern.

## How Tags Differ from Locks and RBAC
- **Tags** are metadata (informational, queryable, used for billing).
- **Locks** prevent deletion or modification.
- **RBAC** controls who can perform what actions.
Together, they form a complete governance model.

## Cost Allocation in Practice
In Cost Management + Billing → Cost analysis, you can:
- Group by **Tag: Environment** to see how much each environment costs.
- Filter by **Tag: CostCenter** to report costs per department.
- Export cost data with tags for custom chargeback reports.

## Limitations
- Max 50 tags per resource.
- Tags on resource groups are **not** automatically inherited by child resources (unless using policy).
- Some resource types (e.g., classic resources) don't support tags.
- Tag names are case‑insensitive in Azure portal but case‑sensitive in some APIs/tools.

## What We Tested
- Creating a resource without required tags → **denied**.
- Creating a resource with an invalid `Environment` value → **denied**.
- Creating a resource inside a tagged resource group → **tag automatically appended**.
- Querying resources by tags for inventory and cost analysis.