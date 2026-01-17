//=============================================================================
// Failed Requests Alert
//=============================================================================

//=============================================================================
// Parameters
//=============================================================================

@description('Location to use for all resources')
param location string

@description('The tags to associate with the resource')
param tags object

@description('The name of the App Insights instance that will be used by the Logic App')
param appInsightsName string

@description('The ID of the action group to notify when an alert is triggered')
param actionGroupId string

//=============================================================================
// Existing resources
//=============================================================================

resource appInsights 'Microsoft.Insights/components@2020-02-02' existing = {
  name: appInsightsName
}

//=============================================================================
// Resources
//=============================================================================

// Create alert rule that triggers on a failed request logged in App Insights

resource failedRequestsScheduledQueryRule 'Microsoft.Insights/scheduledQueryRules@2023-12-01' = {
  name: 'Failed Requests Alert - ${appInsightsName}'
  location: location
  tags: tags

  properties: {
    displayName: 'Failed Requests Alert - ${appInsightsName}'
    description: 'Alert that triggers when a failed request is logged in Application Insights'
    severity: 1
    enabled: true
    autoMitigate: false
  
    scopes: [
      appInsights.id
    ]

    actions: {
      actionGroups: [
        actionGroupId
      ]
    }
    
    evaluationFrequency: 'PT15M' // Execute every 15 minutes
    windowSize: 'PT15M'          // Look at the query results from the last 15 minutes
    muteActionsDuration: 'PT1H'  // Maximum of 1 alert per 1 hour (unless solved)

    criteria: {
      allOf: [
        {
          query: 'requests | where success == false'
          timeAggregation: 'Count'
          operator: 'GreaterThanOrEqual'
          threshold: 1
          failingPeriods: {
            minFailingPeriodsToAlert: 1  // 'Number of violations' in the UI
            numberOfEvaluationPeriods: 1 // 'Evaluation period' in the UI
          }
        }
      ]
    }

    targetResourceTypes: [
      'Microsoft.Insights/components'
    ]
  }
}
