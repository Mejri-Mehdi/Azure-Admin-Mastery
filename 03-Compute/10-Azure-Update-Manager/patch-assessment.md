# Patch Assessment Results

## Machines Assessed
- **vm-update1** (Ubuntu 22.04)
- **vm-update2** (Ubuntu 22.04)

## Assessment Date
2026-07-24

## Assessment Trigger
Triggered on-demand from Azure Update Manager portal.

## Results Summary
| VM Name       | Missing Updates | Critical / Security | Last Assessed |
|---------------|-----------------|---------------------|---------------|
| vm-update1    | 12              | 3 critical, 5 security | 2026-07-24 14:30 |
| vm-update2    | 10              | 2 critical, 4 security | 2026-07-24 14:30 |

*(Screenshot attached below)*

## On‑Demand Installation
- **Action**: Ran "Install updates now" for both VMs.
- **Status**: Success. All critical and security updates applied.
- **Reboots**: None required.

## Notes
- Azure Update Manager identifies missing updates via the package manager (apt for Ubuntu, Windows Update for Windows).
- Assessment runs automatically every 12 hours, but can be triggered manually as above.
- The maintenance configuration will automatically apply patches every Sunday at 2 AM, with a 3-hour window.