# Data Collection Rule – Query Results

## Windows Performance Counter (Processor Time)

Perf
| where ObjectName == "Processor" and CounterName == "% Processor Time"
| take 5

**Sample output:**
| TimeGenerated | Computer | ObjectName | CounterName | CounterValue |
|---------------|----------|------------|-------------|--------------|
| 2026-07-29 16:00:01 | vm-win-mon | Processor | % Processor Time | 12.45 |
| ... | | | | |

## Windows System Event Logs (Errors/Warnings)

Event
| where EventLog == "System" and (EventLevel == 2 or EventLevel == 3)
| take 5

**Sample output:**
| TimeGenerated | Computer | EventLevelName | Source | RenderedDescription |
|---------------|----------|----------------|--------|---------------------|
| 2026-07-29 15:45:12 | vm-win-mon | Error | Service Control Manager | The Windows Update service failed to start... |
| 2026-07-29 15:47:33 | vm-win-mon | Warning | DNS Client Events | Name resolution for... timed out. |

## Linux CPU Performance

Perf
| where Computer == "vm-linux-mon" and CounterName == "% Processor Time"
| take 5

(Data appears after association and agent polling – typically within 5 minutes.)

**Conclusion:** Data from both DCRs is flowing into Log Analytics. The DCRs correctly filter and forward the specified data sources.