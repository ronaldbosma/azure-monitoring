param(
    [string]$ResourceGroupName,
    [string]$AppInsightsName
)

Write-Host "Deploying APIM Insights Workbook to resource group '$ResourceGroupName' with Application Insights instance '$AppInsightsName'..."

$TemplateFile = Join-Path -Path $PSScriptRoot -ChildPath 'main.bicep'

az deployment group create `
    --name 'apim-insights-workbook-deployment' `
    --resource-group $ResourceGroupName `
    --template-file $TemplateFile `
    --parameters appInsightsName=$AppInsightsName `
    --verbose

write-host "APIM Insights Workbook deployment completed."