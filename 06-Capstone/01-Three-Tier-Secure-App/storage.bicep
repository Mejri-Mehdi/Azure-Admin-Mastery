param location string

param dbSubnetId string



// ======================================
// STORAGE ACCOUNT
// ======================================

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {

  name: 'stglogs${uniqueString(resourceGroup().id)}'

  location: location


  sku: {

    name: 'Standard_LRS'

  }


  kind: 'StorageV2'


  properties: {

    accessTier: 'Hot'


    minimumTlsVersion: 'TLS1_2'


    allowBlobPublicAccess: false


    publicNetworkAccess: 'Disabled'

  }

}



// ======================================
// PRIVATE DNS ZONE FOR BLOB
// ======================================

resource blobPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {

  name: 'privatelink.blob.${environment().suffixes.storage}'

  location: 'global'

}



// ======================================
// PRIVATE DNS ZONE LINK TO VNET
// ======================================

// Extract VNET ID from subnet ID

var vnetId = resourceId(
  'Microsoft.Network/virtualNetworks',
  split(dbSubnetId, '/')[8]
)


resource dnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {

  parent: blobPrivateDnsZone

  name: 'blob-dns-link'


  properties: {

    virtualNetwork: {

      id: vnetId

    }


    registrationEnabled: false

  }

}



// ======================================
// PRIVATE ENDPOINT
// ======================================

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-05-01' = {

  name: 'pe-storage-blob'

  location: location


  properties: {

    subnet: {

      id: dbSubnetId

    }


    privateLinkServiceConnections: [

      {

        name: 'storage-blob-connection'


        properties: {

          privateLinkServiceId: storageAccount.id


          groupIds: [

            'blob'

          ]

        }

      }

    ]

  }

}



// ======================================
// PRIVATE DNS ZONE GROUP
// ======================================

resource privateDnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-05-01' = {

  parent: privateEndpoint


  name: 'default'


  properties: {

    privateDnsZoneConfigs: [

      {

        name: 'blob-zone-config'


        properties: {

          privateDnsZoneId: blobPrivateDnsZone.id

        }

      }

    ]

  }

}



// ======================================
// OUTPUTS
// ======================================

output storageAccountId string = storageAccount.id

output storageAccountName string = storageAccount.name

output privateEndpointId string = privateEndpoint.id
