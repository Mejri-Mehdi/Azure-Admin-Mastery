# Policy Definitions Used

| Policy Name                          | Assignment Name                      | Scope         | Effect     | Parameters |
|--------------------------------------|--------------------------------------|---------------|------------|------------|
| Require a tag on resource groups     | Require CostCenter tag on RGs        | Subscription  | Deny       | Tag name = CostCenter |
| Allowed locations                    | Allowed locations - eastus, westus2  | Subscription  | Deny       | Allowed locations = eastus,westus2 |
| VMs should have backup configured    | Part of Secure Baseline Initiative   | Subscription  | Audit      | None (default) |

All three policies are also bundled in the **Secure Baseline Initiative** assigned to the subscription.