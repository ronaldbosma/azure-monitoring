//=============================================================================
// Logic App Workflows Workbook
//=============================================================================

//=============================================================================
// Parameters
//=============================================================================

@description('The name of the App Insights instance that will be used as the data source for this workbook')
param appInsightsName string

@description('The display name of the workbook')
param workbookDisplayName string = 'Logic App Workflows'

@description('The unique guid for this workbook instance')
param workbookId string = guid(resourceGroup().id, workbookDisplayName)

//=============================================================================
// Existing resources
//=============================================================================

resource appInsights 'Microsoft.Insights/components@2020-02-02' existing = {
  name: appInsightsName
}

//=============================================================================
// Resources
//=============================================================================

resource workbook 'Microsoft.Insights/workbooks@2023-06-01' = {
  name: workbookId
  location: resourceGroup().location
  kind: 'shared'
  properties: {
    displayName: workbookDisplayName
    category: 'workbook'
    serializedData: loadTextContent('./Logic App Workflows.workbook')
    sourceId: appInsights.id
    version: '1.0'
  }
}
