# Data Sources (Data Collection Rules)

## Windows DCR: `dcr-windows`
- **Associated VM**: `vm-win-mon`
- **Data sources**:
  - **Windows Event Logs**: Application, System, Security
  - **Performance Counters** (every 60s): Processor % Time, Memory % Committed, Logical Disk % Free Space

## Linux DCR: `dcr-linux`
- **Associated VM**: `vm-linux-mon`
- **Data sources**:
  - **Syslog**: auth, cron, kern facilities at Info, Warning, Error levels

## How Association Works
- A **Data Collection Rule Association** links a DCR to a specific VM (or VMSS).
- When the AMA agent on the VM polls for configuration, it applies the DCR and starts sending the specified data.
- Associations can be created at the VM or at the subscription/resource group level for broader coverage.