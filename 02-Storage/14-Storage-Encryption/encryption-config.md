# Customer-Managed Key Encryption Configuration

## Storage Account: `cmkstgxyz123`
- **Resource Group**: `rg-cmk-storage`
- **Region**: East US
- **SKU**: Standard_LRS
- **Encryption type**: Customer‑managed keys (CMK)

## Key Vault
- **Name**: `kv-cmk-stg-xyz123`
- **Purge protection**: Enabled
- **Soft‑delete**: Enabled

## Key
- **Name**: `storage-cmk-key`
- **Type**: RSA 2048‑bit
- **Auto‑rotation**: Enabled

## Managed Identity
- **Type**: System‑assigned
- **Principal ID**: `...`
- **Role**: Key Vault Crypto Service Encryption User (assigned at Key Vault scope)

## Configuration Steps (CLI)
```powershell
# Create Key Vault with purge protection and soft-delete
az keyvault create --name kv-cmk-stg-xyz123 -g rg-cmk-storage --location eastus --enable-purge-protection true --enable-soft-delete true

# Create RSA key
az keyvault key create --vault-name kv-cmk-stg-xyz123 --name storage-cmk-key --protection software --kty RSA --size 2048

# Create storage account with managed identity
az storage account create --name cmkstgxyz123 -g rg-cmk-storage --location eastus --sku Standard_LRS --kind StorageV2 --assign-identity

# Grant access (role assignment)
$principalId=$(az storage account show -n cmkstgxyz123 -g rg-cmk-storage --query identity.principalId -o tsv)
az role assignment create --assignee $principalId --role "Key Vault Crypto Service Encryption User" --scope $keyVaultResourceId

# Apply CMK
az storage account update -n cmkstgxyz123 -g rg-cmk-storage --encryption-key-name storage-cmk-key --encryption-key-source Microsoft.KeyVault --encryption-key-vault $keyVaultResourceId --encryption-key-version $keyUri