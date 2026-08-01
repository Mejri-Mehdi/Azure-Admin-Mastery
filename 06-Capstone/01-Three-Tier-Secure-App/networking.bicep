param location string

param vnetAddressPrefix string

param webSubnetPrefix string

param appSubnetPrefix string

param dbSubnetPrefix string

param bastionSubnetPrefix string



// ======================================
// WEB NSG
// ======================================

resource webNsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {

  name: 'nsg-web'

  location: location


  properties: {

    securityRules: [

      {
        name: 'AllowHTTP'

        properties: {

          priority: 100

          direction: 'Inbound'

          access: 'Allow'

          protocol: 'Tcp'

          sourceAddressPrefix: 'Internet'

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '80'

        }

      }


      {
        name: 'AllowHTTPS'

        properties: {

          priority: 110

          direction: 'Inbound'

          access: 'Allow'

          protocol: 'Tcp'

          sourceAddressPrefix: 'Internet'

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '443'

        }

      }


      {
        name: 'DenyInternet'

        properties: {

          priority: 4096

          direction: 'Inbound'

          access: 'Deny'

          protocol: '*'

          sourceAddressPrefix: 'Internet'

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '*'

        }

      }

    ]

  }

}



// ======================================
// APP NSG
// ======================================

resource appNsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {

  name: 'nsg-app'

  location: location


  properties: {

    securityRules: [

      {

        name: 'AllowWebToApp'


        properties: {

          priority: 100

          direction: 'Inbound'

          access: 'Allow'

          protocol: 'Tcp'

          sourceAddressPrefix: webSubnetPrefix

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '8080'

        }

      }


      {

        name: 'DenyInternet'


        properties: {

          priority: 4096

          direction: 'Inbound'

          access: 'Deny'

          protocol: '*'

          sourceAddressPrefix: 'Internet'

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '*'

        }

      }

    ]

  }

}



// ======================================
// DATABASE NSG
// ======================================

resource dbNsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {

  name: 'nsg-db'

  location: location


  properties: {

    securityRules: [

      {

        name: 'AllowAppToSQL'


        properties: {

          priority: 100

          direction: 'Inbound'

          access: 'Allow'

          protocol: 'Tcp'

          sourceAddressPrefix: appSubnetPrefix

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '1433'

        }

      }


      {

        name: 'DenyInternet'


        properties: {

          priority: 4096

          direction: 'Inbound'

          access: 'Deny'

          protocol: '*'

          sourceAddressPrefix: 'Internet'

          sourcePortRange: '*'

          destinationAddressPrefix: '*'

          destinationPortRange: '*'

        }

      }

    ]

  }

}



// ======================================
// VIRTUAL NETWORK
// ======================================

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {

  name: 'vnet-capstone'

  location: location


  properties: {

    addressSpace: {

      addressPrefixes: [

        vnetAddressPrefix

      ]

    }


    subnets: [

      {

        name: 'snet-web'

        properties: {

          addressPrefix: webSubnetPrefix

          networkSecurityGroup: {

            id: webNsg.id

          }

        }

      }


      {

        name: 'snet-app'

        properties: {

          addressPrefix: appSubnetPrefix

          networkSecurityGroup: {

            id: appNsg.id

          }

        }

      }


      {

        name: 'snet-db'

        properties: {

          addressPrefix: dbSubnetPrefix

          networkSecurityGroup: {

            id: dbNsg.id

          }

        }

      }


      {

        name: 'AzureBastionSubnet'

        properties: {

          addressPrefix: bastionSubnetPrefix

        }

      }

    ]

  }

}



// ======================================
// OUTPUTS
// ======================================


output vnetName string = vnet.name


output webSubnetId string = resourceId(
  'Microsoft.Network/virtualNetworks/subnets',
  vnet.name,
  'snet-web'
)


output appSubnetId string = resourceId(
  'Microsoft.Network/virtualNetworks/subnets',
  vnet.name,
  'snet-app'
)


output dbSubnetId string = resourceId(
  'Microsoft.Network/virtualNetworks/subnets',
  vnet.name,
  'snet-db'
)


output bastionSubnetName string = 'AzureBastionSubnet'


output webNsgId string = webNsg.id


output appNsgId string = appNsg.id


output dbNsgId string = dbNsg.id
