# Storage Account Key Rotation Procedure

**Objective**: Rotate one of the two storage account access keys without downtime.

## Prerequisites
- Storage account: `keyrotxyz123`
- Two keys available: `key1` (primary), `key2` (secondary)

## Steps
1. **Identify applications using keys**  
   Audit all apps that rely on the storage account keys. Ensure they support key rotation (most SDKs can accept multiple keys).

2. **Update applications to use secondary key**  
   If key1 is to be rotated, temporarily switch apps to use key2.

3. **Regenerate the primary key (key1)**  
   ```powershell
   az storage account keys renew -n keyrotxyz123 -g rg-keyrotation --key primary
   The old key1 is immediately invalidated.

4. **Update applications with the new key1**
   Distribute the new key1 to apps that will use it.

5. **(Optional) Rotate key2 later**
   Repeat the process for key2 to maintain symmetric rotation.

## Validation

After rotation, old key1 fails to authenticate.

key2 continues to work (ensuring zero‑downtime during rotation).

All applications are updated with the new key(s).

## Why Two Keys?

Azure provides two keys to support online rotation: while one is being regenerated, apps can rely on the other, avoiding interruptions.