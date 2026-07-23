// main.bicep
@description('Name of the virtual machine')
param vmName string

@description('Administrator username')
@minLength(1)
param adminUsername string

@description('Administrator password (for Windows)')
@minLength(8)
@secure()
param adminPassword string

@description('Size of the VM')
param vmSize string = 'Standard_F1ads_v7'

@description('Location for all resources')
param location string = resourceGroup().location

// Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: 'vnet-${vmName}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.3.0.0/16']
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.3.0.0/24'
        }
      }
    ]
  }
}

// Network Security Group
resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'nsg-${vmName}'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowRDP'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '3389'
        }
      }
    ]
  }
}

// Associate NSG with subnet
resource subnetNsg 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  parent: vnet
  name: 'default'
  properties: {
    addressPrefix: '10.3.0.0/24'
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

// Use NIC module
module nicModule 'nic-module.bicep' = {
  name: 'nicDeployment'
  params: {
    nicName: '${vmName}-nic'
    subnetId: '${vnet.id}/subnets/default'
    location: location
  }
}

// Virtual Machine
resource vm 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
        diskSizeGB: 128
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicModule.outputs.nicId
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

output vmId string = vm.id
output publicIp string = nicModule.outputs.publicIp
output privateIp string = nicModule.outputs.privateIp
