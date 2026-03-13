param(
    [string]$ResourceGroupName,
    [string]$AppInsightsName
)

Write-Host "Deploying Logic App Workflows Workbook to resource group '$ResourceGroupName' with Application Insights instance '$AppInsightsName'..."

$TemplateFile = Join-Path -Path $PSScriptRoot -ChildPath 'main.bicep'

az deployment group create `
    --name 'logic-app-workflows-workbook-deployment' `
    --resource-group $ResourceGroupName `
    --template-file $TemplateFile `
    --parameters appInsightsName=$AppInsightsName `
    --verbose

Write-Host "Logic App Workflows Workbook deployment completed."