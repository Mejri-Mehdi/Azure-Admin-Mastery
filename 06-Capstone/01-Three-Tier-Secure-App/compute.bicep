param location string

param adminUsername string

@secure()
param adminPassword string

param webVmSize string
param appVmSize string
param dbVmSize string


param webSubnetId string
param appSubnetId string
param dbSubnetId string


param bastionSubnetName string

param webNsgId string
param appNsgId string
param dbNsgId string


param vnetName string

param lbBackendPoolId string



// ======================================
// WEB NIC 1
// ======================================

resource webNic1 'Microsoft.Network/networkInterfaces@2023-05-01' = {

  name: 'web-nic-1'

  location: location


  properties: {

    networkSecurityGroup: {

      id: webNsgId

    }


    ipConfigurations: [

      {

        name: 'ipconfig1'


        properties: {

          privateIPAllocationMethod: 'Dynamic'


          subnet: {

            id: webSubnetId

          }


          loadBalancerBackendAddressPools: [

            {

              id: lbBackendPoolId

            }

          ]

        }

      }

    ]

  }

}



// ======================================
// WEB VM 1
// ======================================

resource webVm1 'Microsoft.Compute/virtualMachines@2024-11-01' = {

  name: 'web-vm-1'

  location: location


  properties: {

    hardwareProfile: {

      vmSize: webVmSize

    }


    osProfile: {

      computerName: 'web-vm-1'

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

      }

    }


    networkProfile: {

      networkInterfaces: [

        {

          id: webNic1.id

        }

      ]

    }

  }

}



// ======================================
// WEB NIC 2
// ======================================

resource webNic2 'Microsoft.Network/networkInterfaces@2023-05-01' = {

  name: 'web-nic-2'

  location: location


  properties: {

    networkSecurityGroup: {

      id: webNsgId

    }


    ipConfigurations: [

      {

        name: 'ipconfig1'


        properties: {

          privateIPAllocationMethod: 'Dynamic'


          subnet: {

            id: webSubnetId

          }


          loadBalancerBackendAddressPools: [

            {

              id: lbBackendPoolId

            }

          ]

        }

      }

    ]

  }

}



// ======================================
// WEB VM 2
// ======================================

resource webVm2 'Microsoft.Compute/virtualMachines@2024-11-01' = {

  name: 'web-vm-2'

  location: location


  properties: {

    hardwareProfile: {

      vmSize: webVmSize

    }


    osProfile: {

      computerName: 'web-vm-2'

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

      }

    }


    networkProfile: {

      networkInterfaces: [

        {

          id: webNic2.id

        }

      ]

    }

  }

}



// ======================================
// APP NIC
// ======================================

resource appNic 'Microsoft.Network/networkInterfaces@2023-05-01' = {

  name: 'app-nic'

  location: location


  properties: {

    networkSecurityGroup: {

      id: appNsgId

    }


    ipConfigurations: [

      {

        name: 'ipconfig1'


        properties: {

          privateIPAllocationMethod: 'Dynamic'


          subnet: {

            id: appSubnetId

          }

        }

      }

    ]

  }

}



// ======================================
// APP VM
// ======================================

resource appVm 'Microsoft.Compute/virtualMachines@2024-11-01' = {

  name: 'app-vm'

  location: location


  properties: {

    hardwareProfile: {

      vmSize: appVmSize

    }


    osProfile: {

      computerName: 'app-vm'

      adminUsername: adminUsername

      adminPassword: adminPassword

    }


    storageProfile: {

      imageReference: {

        publisher: 'Canonical'

        offer: '0001-com-ubuntu-server-jammy'

        sku: '22_04-lts-gen2'

        version: 'latest'

      }


      osDisk: {

        createOption: 'FromImage'

        managedDisk: {

          storageAccountType: 'StandardSSD_LRS'

        }

      }

    }


    networkProfile: {

      networkInterfaces: [

        {

          id: appNic.id

        }

      ]

    }

  }

}



// ======================================
// DATABASE NIC
// ======================================

resource dbNic 'Microsoft.Network/networkInterfaces@2023-05-01' = {

  name: 'db-nic'

  location: location


  properties: {

    networkSecurityGroup: {

      id: dbNsgId

    }


    ipConfigurations: [

      {

        name: 'ipconfig1'


        properties: {

          privateIPAllocationMethod: 'Dynamic'


          subnet: {

            id: dbSubnetId

          }

        }

      }

    ]

  }

}



// ======================================
// DATABASE VM
// ======================================

resource dbVm 'Microsoft.Compute/virtualMachines@2024-11-01' = {

  name: 'db-vm'

  location: location


  properties: {

    hardwareProfile: {

      vmSize: dbVmSize

    }


    osProfile: {

      computerName: 'db-vm'

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

      }

    }


    networkProfile: {

      networkInterfaces: [

        {

          id: dbNic.id

        }

      ]

    }

  }

}



// ======================================
// BASTION
// ======================================

resource bastionPublicIp 'Microsoft.Network/publicIPAddresses@2023-05-01' = {

  name: 'bastion-pip'

  location: location


  sku: {

    name: 'Standard'

  }


  properties: {

    publicIPAllocationMethod: 'Static'

  }

}



resource bastion 'Microsoft.Network/bastionHosts@2023-05-01' = {

  name: 'bastion-host'

  location: location


  properties: {

    ipConfigurations: [

      {

        name: 'bastionConfig'


        properties: {

          subnet: {

            id: resourceId(
              'Microsoft.Network/virtualNetworks/subnets',
              vnetName,
              bastionSubnetName
            )

          }


          publicIPAddress: {

            id: bastionPublicIp.id

          }

        }

      }

    ]

  }

}



// ======================================
// OUTPUTS
// ======================================


output webNic1Id string = webNic1.id

output webNic2Id string = webNic2.id


output webVm1Id string = webVm1.id

output webVm2Id string = webVm2.id


output appVmId string = appVm.id

output dbVmId string = dbVm.id


output webVm1Name string = webVm1.name

output webVm2Name string = webVm2.name

output appVmName string = appVm.name

output dbVmName string = dbVm.name
