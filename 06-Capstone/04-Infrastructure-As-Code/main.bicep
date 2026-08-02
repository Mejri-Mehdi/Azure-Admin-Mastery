param environment string = 'dev'
param location string = resourceGroup().location
param vmAdminUsername string
@secure()
param vmAdminPassword string

// Environment‑specific sizes and names
var envSuffix = environment == 'prod' ? 'prod' : 'dev'
var vmSize = environment == 'prod' ? 'Standard_D2s_v3' : 'Standard_B2s'
var vnetName = 'vnet-${envSuffix}'
var storageName = 'stg${envSuffix}${uniqueString(resourceGroup().id)}'

module net './modules/network.bicep' = {
  name: 'network'
  params: {
    location: location
    vnetName: vnetName
    subnets: [
      {
        name: 'snet-web'
        prefix: '10.0.1.0/24'
        nsgRules: [
          {
            name: 'AllowHTTP'
            priority: 100
            access: 'Allow'
            source: 'Internet'
            destinationPort: '80'
          }
        ]
      }
      {
        name: 'snet-app'
        prefix: '10.0.2.0/24'
        nsgRules: []
      }
    ]
  }
}

module compute './modules/compute.bicep' = {
  name: 'compute'
  params: {
    location: location
    vmName: 'vm-${envSuffix}'
    vmSize: vmSize
    adminUsername: vmAdminUsername
    adminPassword: vmAdminPassword
    subnetId: net.outputs.webSubnetId
    osType: 'Windows'
  }
}

module storage './modules/storage.bicep' = {
  name: 'storage'
  params: {
    location: location
    storageAccountName: storageName
    subnetId: net.outputs.appSubnetId
  }
}

module monitoring './modules/monitoring.bicep' = {
  name: 'monitoring'
  params: {
    location: location
    vmId: compute.outputs.vmId
  }
}
