param(
    [string]$ResourceGroupName,
    [string]$AppInsightsName
)

Write-Host "Deploying Azure Functions Workbook to resource group '$ResourceGroupName' with Application Insights instance '$AppInsightsName'..."

$TemplateFile = Join-Path -Path $PSScriptRoot -ChildPath 'main.bicep'

az deployment group create `
    --name 'azure-functions-workbook-deployment' `
    --resource-group $ResourceGroupName `
    --template-file $TemplateFile `
    --parameters appInsightsName=$AppInsightsName `
    --verbose

Write-Host "Azure Functions Workbook deployment completed."