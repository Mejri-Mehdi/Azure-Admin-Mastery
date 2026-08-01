targetScope = 'resourceGroup'

param location string = resourceGroup().location
param vnetAddressPrefix string = '10.0.0.0/16'
param webSubnetPrefix string = '10.0.1.0/24'
param appSubnetPrefix string = '10.0.2.0/24'
param dbSubnetPrefix string = '10.0.3.0/24'
param bastionSubnetPrefix string = '10.0.4.0/26'
param webVmSize string = 'Standard_D2lds_v7'
param appVmSize string = 'Standard_D2lds_v7'
param dbVmSize string = 'Standard_D2lds_v7'
param adminUsername string = 'azureuser'
@secure()
param adminPassword string  // In production, use a secure method to handle secrets

// Networking module
module networking './networking.bicep' = {
  name: 'networking'
  params: {
    location: location
    vnetAddressPrefix: vnetAddressPrefix
    webSubnetPrefix: webSubnetPrefix
    appSubnetPrefix: appSubnetPrefix
    dbSubnetPrefix: dbSubnetPrefix
    bastionSubnetPrefix: bastionSubnetPrefix
  }
}

// Compute module (VMs and Bastion)
module compute './compute.bicep' = {
  name: 'compute'
  params: {
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    webVmSize: webVmSize
    appVmSize: appVmSize
    dbVmSize: dbVmSize
    webSubnetId: networking.outputs.webSubnetId
    appSubnetId: networking.outputs.appSubnetId
    dbSubnetId: networking.outputs.dbSubnetId
    bastionSubnetName: networking.outputs.bastionSubnetName
    webNsgId: networking.outputs.webNsgId
    appNsgId: networking.outputs.appNsgId
    dbNsgId: networking.outputs.dbNsgId
    vnetName: networking.outputs.vnetName
    lbBackendPoolId: loadBalancer.outputs.backendPoolId    // NEW

  }
}

// Load balancer for web tier
module loadBalancer './loadBalancer.bicep' = {
  name: 'loadBalancer'
  params: {
    location: location
  }
}

// Storage account with private endpoint
module storage './storage.bicep' = {
  name: 'storage'
  params: {
    location: location
    dbSubnetId: networking.outputs.dbSubnetId
  }
}

module monitoring './monitoring.bicep' = {
  name: 'monitoring'

  params: {
    location: location

    webVm1Id: compute.outputs.webVm1Id
    webVm2Id: compute.outputs.webVm2Id
  }
}

// RBAC assignments (requires existing Azure AD groups – will be done via CLI)
// We'll output the resource group ID for RBAC
output resourceGroupId string = resourceGroup().id
