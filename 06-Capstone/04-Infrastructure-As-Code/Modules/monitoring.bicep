param location string = resourceGroup().location
param workspaceName string = 'law-${uniqueString(resourceGroup().id)}'
param vmId string
param alertThreshold int = 80

resource workspace 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' = {
  name: workspaceName
  location: location
  properties: { sku: { name: 'PerGB2018' } }
}

resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'CPU-Alert'
  location: location
  properties: {
    description: 'Alert when CPU exceeds ${alertThreshold}% for 5 minutes'
    severity: 2
    enabled: true
    scopes: [ vmId ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      // Specify the required OData type for metric alert criteria
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'Metric1'
          metricName: 'Percentage CPU'
          operator: 'GreaterThan'
          threshold: alertThreshold
          timeAggregation: 'Average'
          criterionType: 'StaticThresholdCriterion'
        }
      ]
    }
  }
}

output workspaceId string = workspace.id
