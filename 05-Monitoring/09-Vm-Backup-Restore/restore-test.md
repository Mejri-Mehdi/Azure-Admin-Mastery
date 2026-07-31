# VM Restore Test Results

## File‑Level Recovery Test
- **VM**: `vm-win-bk`
- **Recovery point**: 2026-07-31 02:00 UTC
- **Script executed**: `IaaSClientVM-<guid>.exe`
- **Mount result**: Successfully mounted backup disks as drive `G:`.
- **File copied**: `C:\inetpub\wwwroot\Default.htm` → local desktop.
- **Unmount**: Closed script, drive disappeared.
- **Conclusion**: File‑level recovery works as expected; individual files can be retrieved without restoring the entire VM.

## Full VM Restore Test
- **Restore type**: Create new VM
- **Source VM**: `vm-win-bk`
- **Target VM**: `vm-restored`
- **Restore point**: 2026-07-31 02:00 UTC
- **Restore job**: Completed successfully in ~12 minutes.
- **Verification**:
  - RDP connected to `vm-restored` using original credentials.
  - OS booted correctly; all previously installed roles (IIS) present.
  - Custom web page at `http://localhost` displayed correctly.
- **Conclusion**: Full VM restore preserves the entire OS, applications, and data. The new VM is functional and identical to the source at the time of backup.