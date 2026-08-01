param location string



// ======================================
// PUBLIC IP FOR LOAD BALANCER
// ======================================

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-05-01' = {

  name: 'web-lb-pip'

  location: location


  sku: {

    name: 'Standard'

  }


  properties: {

    publicIPAllocationMethod: 'Static'

  }

}



// ======================================
// LOAD BALANCER
// ======================================

resource lb 'Microsoft.Network/loadBalancers@2023-05-01' = {

  name: 'web-lb'

  location: location


  sku: {

    name: 'Standard'

  }


  properties: {


    // ----------------------------
    // Frontend IP
    // ----------------------------

    frontendIPConfigurations: [

      {

        name: 'webFrontEnd'


        properties: {

          publicIPAddress: {

            id: publicIp.id

          }

        }

      }

    ]



    // ----------------------------
    // Backend Pool
    // ----------------------------

    backendAddressPools: [

      {

        name: 'webBackEndPool'

      }

    ]



    // ----------------------------
    // Health Probe
    // ----------------------------

    probes: [

      {

        name: 'http-probe'


        properties: {

          protocol: 'Tcp'

          port: 80

          intervalInSeconds: 15

          numberOfProbes: 2

        }

      }

    ]



    // ----------------------------
    // Load Balancing Rule
    // ----------------------------

    loadBalancingRules: [

      {

        name: 'http-rule'


        properties: {

          frontendIPConfiguration: {

            id: resourceId(
              'Microsoft.Network/loadBalancers/frontendIPConfigurations',
              'web-lb',
              'webFrontEnd'
            )

          }


          backendAddressPool: {

            id: resourceId(
              'Microsoft.Network/loadBalancers/backendAddressPools',
              'web-lb',
              'webBackEndPool'
            )

          }


          probe: {

            id: resourceId(
              'Microsoft.Network/loadBalancers/probes',
              'web-lb',
              'http-probe'
            )

          }


          protocol: 'Tcp'


          frontendPort: 80


          backendPort: 80


          enableFloatingIP: false


          idleTimeoutInMinutes: 4


          disableOutboundSnat: true

        }

      }

    ]

  }

}



// ======================================
// OUTPUTS
// ======================================


output loadBalancerId string = lb.id


output backendPoolId string = resourceId(
  'Microsoft.Network/loadBalancers/backendAddressPools',
  lb.name,
  'webBackEndPool'
)


output frontendIpId string = resourceId(
  'Microsoft.Network/loadBalancers/frontendIPConfigurations',
  lb.name,
  'webFrontEnd'
)
