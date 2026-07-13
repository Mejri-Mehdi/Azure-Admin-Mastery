param storageAccountName string
param location string = resourceGroup().location
param sku string = 'Standard_LRS'

resource stg 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: { name: sku }
  kind: 'StorageV2'
}

output storageEndpoint string = stg.properties.primaryEndpoints.blob
