//=============================================================================
// Azure Functions Workbook
//=============================================================================

//=============================================================================
// Parameters
//=============================================================================

@description('The name of the App Insights instance that will be used as the data source for this workbook')
param appInsightsName string

@description('The display name of the workbook')
param workbookDisplayName string = 'Azure Functions'

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
    serializedData: loadTextContent('./Azure Functions.workbook')
    sourceId: appInsights.id
    version: '1.0'
  }
}
