# VM Insights Configuration

## Enabled VMs
- `vm-win-mon` (Windows Server 2022)
- `vm-linux-mon` (Ubuntu 22.04)

## Agents Installed
| Agent | Purpose |
|-------|---------|
| Azure Monitor Agent (AMA) | Collects performance counters, syslog, event logs |
| Dependency Agent | Maps process‑level connections and dependencies |

Both agents were installed automatically during the VM Insights onboarding process from the Azure Portal.

## Data Collection Rules
The portal created a DCR named `MSVMI-<workspace-name>` (or similar) that defines:
- Performance counters (CPU, memory, disk, network)
- Service Map data (processes, connections)
- Destination: `law-central` Log Analytics workspace

## Data Flow
- AMA collects metrics and forwards to Log Analytics.
- Dependency Agent gathers TCP connection data and sends it to the same workspace.
- VM Insights dashboards query these tables: `Perf`, `InsightsMetrics`, `VMBoundPort`, `VMConnection`, `VMProcess`.

## Verification
- Map view shows live dependencies (e.g., VM communicating with DNS, other services).
- Performance charts display CPU, memory, disk IO, and network throughput.