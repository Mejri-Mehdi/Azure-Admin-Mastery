# Health Alert Configuration

## Service Health Alert
- **Name**: `Service-Issue-EastUS`
- **Scope**: Subscription `<subscription-id>`
- **Condition**: `ServiceHealth` events with severity `Warning`
- **Action Group**: `ag-servicehealth` (email to `you@example.com`)
- **Purpose**: Receive immediate notification when a service issue in East US impacts your subscription.

## Resource Health Alert
- **Name**: `VM-Health-vm-health`
- **Scope**: VM `vm-health` (resource ID `<vm-id>`)
- **Condition**: `ResourceHealth` events with status `Active`
- **Action Group**: `ag-servicehealth`
- **Purpose**: Be alerted if the VM becomes unavailable or degraded.

## Action Group
- **Name**: `ag-servicehealth`
- **Short name**: `SHAlert`
- **Notification**: Email to `you@example.com`