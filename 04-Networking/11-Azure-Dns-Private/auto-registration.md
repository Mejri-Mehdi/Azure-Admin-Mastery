# Auto‑Registration Behavior

**Test VM**: `vm-test-dns` in `vnet-private-dns` (auto‑registration enabled)

## Observed Process
1. Created VM. After ~2 minutes, an A record appeared in the private zone:
   - Name: `vm-test-dns.internal.contoso.com`
   - IP: `10.40.1.4`
2. The record is automatically updated if the VM’s private IP changes (e.g., stop/deallocate/start).
3. From the second VM in a different VNet (linked without auto‑registration), `nslookup vm-test-dns.internal.contoso.com` resolved correctly, proving that auto‑registered records are available cross‑VNet.

## Key Points
- Auto‑registration requires the VNet link to have `registrationEnabled = true`.
- The A record uses the VM’s hostname (computer name).
- The record persists even after the VM is deleted (manual cleanup may be needed).
- Works with Windows and Linux VMs automatically.