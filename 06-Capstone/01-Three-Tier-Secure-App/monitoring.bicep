param location string

param webVm1Id string
param webVm2Id string



// ======================================
// LOG ANALYTICS WORKSPACE
// ======================================

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {

  name: 'law-capstone'

  location: location


  properties: {

    sku: {

      name: 'PerGB2018'

    }

    retentionInDays: 30
  }
}



// ======================================
// RECOVERY SERVICES VAULT
// ======================================

resource vault 'Microsoft.RecoveryServices/vaults@2023-01-01' = {

  name: 'rsv-capstone'

  location: location


  sku: {

    name: 'Standard'

    tier: 'Standard'

  }


  properties: {

    publicNetworkAccess: 'Enabled'

  }
}



// ======================================
// BACKUP POLICY
// Daily backup
// Retain 30 days
// ======================================


resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-01-01' = {

  parent: vault

  name: 'DailyPolicy'


  properties: {

    backupManagementType: 'AzureIaasVM'


    policyType: 'V1'


    schedulePolicy: {

      schedulePolicyType: 'SimpleSchedulePolicy'


      scheduleRunFrequency: 'Daily'


      scheduleRunTimes: [

        '2026-08-01T02:00:00Z'

      ]

    }


    retentionPolicy: {

      retentionPolicyType: 'SimpleRetentionPolicy'


      retentionDuration: {

        count: 30

        durationType: 'Days'

      }

    }


    timeZone: 'UTC'

  }
}




// ======================================
// CPU ALERT
// Web VM CPU > 80% for 5 minutes
// ======================================


resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {


  name: 'CPU-Alert-Web'


  location: 'global'


  properties: {


    description: 'Alert when web VM CPU exceeds 80% for 5 minutes'


    severity: 2


    enabled: true



    scopes: [

      webVm1Id

      webVm2Id

    ]



    evaluationFrequency: 'PT1M'


    windowSize: 'PT5M'



    criteria: {


      'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'



      allOf: [

        {

          name: 'CPUPercentage'


          metricName: 'Percentage CPU'


          metricNamespace: 'Microsoft.Compute/virtualMachines'


          operator: 'GreaterThan'


          threshold: 80


          timeAggregation: 'Average'


          criterionType: 'StaticThresholdCriterion'

        }

      ]

    }



    actions: []

  }

}



// ======================================
// OUTPUTS
// ======================================


output logAnalyticsWorkspaceId string = workspace.id


output recoveryServicesVaultId string = vault.id


output backupPolicyId string = backupPolicy.id


output cpuAlertId string = cpuAlert.id

