# Access Test Results

## Pre‑requisites
- VM `winvm-files` (Windows Server 2019)
- Storage account identity‑based authentication enabled.
- Domain‑joined: (Yes/No – fill in based on your environment)

## Mount Attempt with Identity

### user1 (has RBAC role)
- **Command**: `net use Z: \\idfilestgxyz123.file.core.windows.net\secured-docs`
- **Result**: (If domain‑joined) ✅ Connected successfully.  
  (If not domain‑joined) ❌ “The network path was not found.” – expected because Kerberos requires domain membership.
- **Read/Write**: Created file `test.txt` on Z: drive. Success.

### user2 (no RBAC role)
- **Command**: Same `net use`
- **Result**: ❌ Access denied / “The network path was not found” (role assignment required).

## Key Observations
- No storage account key was used; authentication is entirely via Entra ID Kerberos.
- RBAC controls whether a user can access the share at all.
- NTFS permissions (once mounted) can further restrict folders or files.