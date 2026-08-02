param location string = resourceGroup().location
param vmName string
param vmSize string = 'Standard_B2s'
param adminUsername string
@secure()
param adminPassword string
param subnetId string
param osType string = 'Windows' // 'Windows' or 'Linux'
param osVersion string = '2022-datacenter-azure-edition' // use '22_04-lts-gen2' for Linux
param publisher string = 'MicrosoftWindowsServer'
param offer string = 'WindowsServer'
param sku string = osVersion

resource nic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: '${vmName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: { id: subnetId }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: { vmSize: vmSize }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: osType == 'Windows' ? adminPassword : null
      linuxConfiguration: osType == 'Linux' ? {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: '<your-ssh-public-key>' // replace or make a parameter
            }
          ]
        }
      } : null
    }
    storageProfile: {
      imageReference: {
        publisher: publisher
        offer: offer
        sku: sku
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: { storageAccountType: 'StandardSSD_LRS' }
      }
    }
    networkProfile: {
      networkInterfaces: [{ id: nic.id }]
    }
  }
}

output vmId string = vm.id
output nicId string = nic.id
output privateIp string = nic.properties.ipConfigurations[0].properties.privateIPAddress
