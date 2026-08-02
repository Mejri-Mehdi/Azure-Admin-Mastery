param location string = resourceGroup().location
param vnetName string
param addressPrefix string = '10.0.0.0/16'
param subnets array = [
  {
    name: 'snet-web'
    prefix: '10.0.1.0/24'
    nsgRules: []
  }
  {
    name: 'snet-app'
    prefix: '10.0.2.0/24'
    nsgRules: []
  }
]

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: { addressPrefixes: [ addressPrefix ] }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.prefix
        networkSecurityGroup: contains(subnet, 'nsgRules') && length(subnet.nsgRules) > 0 ? {
          id: nsg.id
        } : null
      }
    }]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = if (length(filter(subnets, s => contains(s, 'nsgRules') && length(s.nsgRules) > 0)) > 0) {
  name: '${vnetName}-nsg'
  location: location
  properties: {
    securityRules: [for rule in first(filter(subnets, s => contains(s, 'nsgRules') && length(s.nsgRules) > 0)).nsgRules: {
      name: rule.name
      properties: {
        priority: rule.priority
        direction: 'Inbound'
        access: rule.access
        protocol: 'Tcp'
        sourceAddressPrefix: rule.source
        sourcePortRange: '*'
        destinationAddressPrefix: '*'
        destinationPortRange: rule.destinationPort
      }
    }]
  }
}

output vnetId string = vnet.id
output webSubnetId string = vnet.properties.subnets[0].id
output appSubnetId string = vnet.properties.subnets[1].id
