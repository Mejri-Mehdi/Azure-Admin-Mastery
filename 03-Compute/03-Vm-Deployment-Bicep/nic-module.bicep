// nic-module.bicep
param nicName string
param location string = resourceGroup().location
param subnetId string

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: '${nicName}-pip'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}

output nicId string = nic.id
output publicIp string = publicIp.properties.ipAddress
output privateIp string = nic.properties.ipConfigurations[0].properties.privateIPAddress
