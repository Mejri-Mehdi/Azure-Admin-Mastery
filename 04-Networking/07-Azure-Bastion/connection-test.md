# Bastion Connection Test

## Test Steps
1. Opened the Azure portal, navigated to `vm-private`.
2. Selected **Connect** → **Bastion**.
3. Authenticated using the SSH private key generated during VM creation.
4. Successfully connected to the VM’s private IP (10.0.1.4) via the Bastion browser terminal.

## File Transfer (Standard SKU)
- Uploaded a local file `test.txt` via the Bastion UI (paperclip icon).
- Verified on the VM: `cat test.txt` showed the content.
- Created a file `fromvm.txt` on the VM, then downloaded it using the same UI.

## Copy‑Paste
- Copied text from the Bastion SSH session to the local clipboard.
- Pasted local text into the SSH session; both directions worked.

## Observations
- No public IP is attached to the VM.
- The VM’s NSG does not need any inbound rules for SSH; all traffic is routed through the Bastion host over port 443.
- The connection is fully encrypted and logged by Azure.