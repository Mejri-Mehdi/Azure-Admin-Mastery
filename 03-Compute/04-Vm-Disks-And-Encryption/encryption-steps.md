# Azure Disk Encryption (ADE) – Step by Step

Azure Disk Encryption (ADE) helps protect the operating system and data disks of Azure virtual machines by using **BitLocker** for Windows VMs and **DM-Crypt** for Linux VMs. ADE integrates with Azure Key Vault to manage encryption keys.

---

## Prerequisites

Before enabling ADE, ensure the following requirements are met:

- Azure VM (supported VM size) deployed.
- Windows or Linux VM with managed identity configured when required.
- Azure Key Vault with:
  - Soft delete enabled.
  - Purge protection enabled.
  - Correct permissions configured.
- Key Vault must be located in the **same Azure region** as the VM.
- The identity used by Azure Disk Encryption must have permissions to access encryption keys.

Required Key Vault key permissions:

- `get`
- `wrapKey`
- `unwrapKey`

---

# Configuration Steps (Azure CLI)

## 1. Create Resource Group

```powershell
az group create `
  --name rg-disk-enc `
  --location eastus
```

---

## 2. Create Key Vault

```powershell
az keyvault create `
  --name kv-ade-disk-xyz123 `
  --resource-group rg-disk-enc `
  --location eastus `
  --enable-purge-protection true `
  --enable-soft-delete true
```

---

## 3. Create Encryption Key

Create an RSA key used by Azure Disk Encryption:

```powershell
az keyvault key create `
  --vault-name kv-ade-disk-xyz123 `
  --name ade-key `
  --protection software `
  --kty RSA `
  --size 2048
```

---

# 4. Configure Key Vault Access Policies

## Give your user account permissions

Your account needs permission to create and manage keys:

Example:

```powershell
az keyvault set-policy `
  --name kv-ade-disk-xyz123 `
  --upn <your-email> `
  --key-permissions get create list delete wrapKey unwrapKey
```

---

## Give Azure Disk Encryption permissions

Azure Disk Encryption requires access to the encryption key.

Required permissions:

```
get
wrapKey
unwrapKey
```

Example:

```powershell
az keyvault set-policy `
  --name kv-ade-disk-xyz123 `
  --object-id <ADE-service-principal-object-id> `
  --key-permissions get wrapKey unwrapKey `
  --secret-permissions get set
```

> Note: The service principal ID can vary depending on the Azure environment. Do not blindly use old GUIDs from outdated documentation. Resolve the correct identity in your tenant.

---

# 5. Enable Azure Disk Encryption on the VM

Enable encryption for OS and data disks:

```powershell
az vm encryption enable `
  --resource-group rg-disk-enc `
  --name vm-enc `
  --disk-encryption-keyvault kv-ade-disk-xyz123 `
  --key-encryption-key ade-key `
  --volume-type ALL
```

Volume options:

| Option | Description |
|---|---|
| OS | Encrypt only the operating system disk |
| DATA | Encrypt only data disks |
| ALL | Encrypt OS and data disks |

---

# 6. Monitor Encryption Status

Check encryption progress:

```powershell
az vm encryption show `
  --resource-group rg-disk-enc `
  --name vm-enc
```

Example states:

```
NotEncrypted
↓
Encrypting
↓
Encrypted
```

---

# Verification

After encryption completes:

- `osVolume` changes from:

```
NotEncrypted → Encrypted
```

- `dataVolumes` change from:

```
NotEncrypted → Encrypted
```

Encryption technologies:

| Operating System | Encryption Technology |
|---|---|
| Windows | BitLocker |
| Linux | DM-Crypt |

The VM can continue running during encryption.

Windows VMs may reboot once during the encryption process.

---

# Important Notes

## Encryption at Rest vs Azure Disk Encryption

Azure provides encryption at rest automatically using Microsoft-managed keys.

ADE provides additional control by allowing customers to use their own encryption keys stored in Azure Key Vault.

| Feature | Encryption at Rest | Azure Disk Encryption |
|---|---|---|
| Default | Enabled automatically | Requires configuration |
| Key ownership | Microsoft-managed keys | Customer-managed keys |
| Encrypts OS disk | Yes | Yes |
| Encrypts data disks | Yes | Yes |
| Uses Key Vault | Optional | Required |

---

## VM Size Compatibility

Not all VM sizes support Azure Disk Encryption.

Example:

```
Standard_F1ads_v7
```

is not supported for ADE.

Use a supported VM size such as:

```
Standard_DS2_v2
```

or another compatible SKU.

Check available resize options:

```powershell
az vm list-vm-resize-options `
  --resource-group rg-disk-enc `
  --name vm-enc
```

---

# Summary

Azure Disk Encryption workflow:

```
Create Key Vault
        |
        ↓
Create RSA Encryption Key
        |
        ↓
Configure Key Vault Permissions
        |
        ↓
Enable ADE on VM
        |
        ↓
Monitor Encryption Status
        |
        ↓
Verify Encrypted Volumes
```

ADE provides customer-controlled encryption for Azure VM disks using keys stored securely in Azure Key Vault.