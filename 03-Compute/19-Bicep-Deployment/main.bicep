param vmName string
param adminUsername string
@secure()
param adminPassword string
param vmSize string = 'Standard_D2lds_v7'
param location string = resourceGroup().location

var vnetName = '${vmName}-vnet'
var nsgName = '${vmName}-nsg'
var publicIpName = '${vmName}-pip'
var nicName = '${vmName}-nic'

module networking './networking.bicep' = {
  name: 'networkingDeployment'
  params: {
    location: location
    vnetName: vnetName
    nsgName: nsgName
    publicIpName: publicIpName
  }
}

module compute './compute.bicep' = {
  name: 'computeDeployment'
  params: {
    location: location
    vmName: vmName
    adminUsername: adminUsername
    adminPassword: adminPassword
    vmSize: vmSize
    nicName: nicName
    subnetId: networking.outputs.subnetId
    publicIpId: networking.outputs.publicIpId
  }
}

output nicId string = compute.outputs.nicId
output vmId string = compute.outputs.vmId
