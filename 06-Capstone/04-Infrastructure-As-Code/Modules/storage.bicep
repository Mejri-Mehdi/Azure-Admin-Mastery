param location string = resourceGroup().location
param storageAccountName string
param subnetId string

resource stg 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
  properties: {}
}

resource pe 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: '${storageAccountName}-pe'
  location: location
  properties: {
    privateLinkServiceConnections: [
      {
        name: 'peconn'
        properties: {
          privateLinkServiceId: stg.id
          groupIds: [ 'blob' ]
        }
      }
    ]
    subnet: { id: subnetId }
  }
}

output storageId string = stg.id
