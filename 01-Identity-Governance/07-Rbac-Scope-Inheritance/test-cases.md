# RBAC Scope Inheritance Test Cases

## Environment
- Subscription: `<Your Subscription>`
- Resource Groups: `rg-inherit-demo`, `rg-inherit-demo2`
- VM: `demo-vm` (moved from `rg-inherit-demo` to `rg-inherit-demo2`)

## Assignments
| User  | Role          | Scope                          |
|-------|---------------|--------------------------------|
| user1 | Reader        | Subscription                   |
| user2 | Contributor   | `rg-inherit-demo`              |
| user3 | Owner         | VM `demo-vm` (in `rg-inherit-demo2`) |

## Test Cases

### 1. user1 sees all resources
- Action: Browse to All Resources as user1.
- Expected: Can see every resource in the subscription, including `demo-vm`.
- Result: ✅ Visible.

### 2. user1 cannot modify any resource
- Action: Try to restart `demo-vm`.
- Expected: Action is denied.
- Result: ❌ Error/Button greyed out.

### 3. user2 has full control over `rg-inherit-demo`
- Action: Create a storage account inside `rg-inherit-demo`.
- Expected: Successful creation.
- Result: ✅ Created.

### 4. user2 cannot assign roles on `rg-inherit-demo`
- Action: In IAM of `rg-inherit-demo`, attempt to add a role assignment.
- Expected: Denied.
- Result: ❌ Error.

### 5. After moving VM, user2 loses access to `demo-vm`
- Action: As user2, try to view `demo-vm` in `rg-inherit-demo2`.
- Expected: Not visible or access denied.
- Result: ❌ Cannot access.

### 6. user3 can manage the specific VM (Owner at VM level)
- Action: As user3, navigate to `demo-vm` (direct URL).
- Expected: Can restart, delete, or assign roles on this VM.
- Result: ✅ Full control over VM.

### 7. user3 cannot see other resources in `rg-inherit-demo2`
- Action: As user3, list resource groups or view `rg-inherit-demo2` resources.
- Expected: Nothing visible.
- Result: ❌ No access.

**Conclusion**: Role assignments strictly follow the scope hierarchy. Inheritance flows downward, and moving a resource changes its scope, breaking role bindings. Least privilege is enforced by assigning exactly the needed scope.