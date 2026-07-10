# APIM Insights Workbook

The workbook [APIM Insights.workbook](./APIM%20Insights.workbook) can be used to gain insights into Azure API Management. The workbook contains the following:

- Capacity and Scaling:
  - Capacity of API Management

    > The Capacity metrics used by the [classic tiers](https://learn.microsoft.com/en-us/azure/api-management/api-management-capacity?tabs=classic) are configured in this graph. 
    > You can reconfigure the graph with these [v2 tier metrics](https://learn.microsoft.com/en-us/azure/api-management/api-management-capacity?tabs=v2-tiers) if you have a v2 tier API Management instance.
    
  - Number of API Management instances _(if value in autoscaling param is selected)_

  ![APIM Insights - Capacity and Scaling](./APIM%20Insights%20-%20Capacity%20and%20Scaling.png)

- Overview:
  - Number of requests
  - Number of failed requests
  - Duration
  

  ![APIM Insights - Overview](./APIM%20Insights%20-%20Overview.png)

- Operation Details:
  - A treeview with information per operation at the root level. At the second level, data is show per result code.  
    When selecting an operation row or underlying result code row. The following data can be viewed for the selected operation and result code:
    - Requests
    - Traces
    - Exceptions
    - Number of requests
    - Number of failed requests
    - Duration
    - Request size
    - Response size

  ![APIM Insights - Operation Details](./APIM%20Insights%20-%20Operation%20Details.png)


## Metrics

The 
https://learn.microsoft.com/en-us/azure/api-management/api-management-capacity?tabs=classic

## Deployment

### Manual Deployment

Follow these steps to manually deploy the workbook:

1. Navigate to your **Application Insights** resource in the **Azure Portal**.
2. Open the **Workbooks** screen.
3. Click on the **+ New** button.
4. Click the **`</>`** button.
5. Ensure the **Gallery Template** tab is selected.
6. Paste the contents of [APIM Insights.workbook](./APIM%20Insights.workbook) into the editor.
7. Click the **Apply** button.
8. Click the **Save** button.
9. Specify a **Title** and configure the correct **Subscription, Resource Group** and **Location** to save the workbook.
10. Click the **Save As** button.

### Deployment via Bicep

A [main.bicep](./main.bicep) file and [deploy.ps1](./deploy.ps1) script are included in this folder, which can be used to deploy the workbook. The workbook is deployed as a shared workbook, which means it will be available for all users with access to the resource group.

1. Navigate to the folder that contains the `main.bicep` file in your terminal.
2. Run the following command to deploy the workbook using the Azure CLI. Make sure to replace the placeholder values for the resource group and Application Insights name with your own values.

    ```
    . ./deploy.ps1 -ResourceGroupName '<your-resource-group>' -AppInsightsName '<your-app-insights>'
    ```

By default, the **Azure Subscription**, **Application Insights**, **API Management** and **API Management Autoscaling** parameters are empty. When deploying the workbook, you may want to specify these parameters. There are several approaches:

1. Use a placeholder value for both parameters and set them during deployment. You can hide these parameters in reading mode by setting the `Hide parameter in reading mode` property to `true`.
2. Remove the parameters from the workbook. Some parameters and the tables reference the different parameters. Replace this with the correct values during deployment.

For an example of how to use placeholders in a workbook during deployment, see [Deploy Azure Workbook and App Insights Function](https://ronaldbosma.github.io/blog/2023/03/10/deploy-azure-workbook-and-app-insights-function/).

If you want to replace placeholders in the workbook with a user-defined Bicep function during deployment, see [Replace placeholders in string with user-defined Bicep function](https://ronaldbosma.github.io/blog/2024/06/21/replace-placeholders-in-string-with-user-defined-bicep-function/).

## Additional Resources

- [Azure Workbook Tips & Tricks](https://ronaldbosma.github.io/blog/2023/02/28/azure-workbook-tips-tricks/)
- [Deploy Azure Workbook and App Insights Function](https://ronaldbosma.github.io/blog/2023/03/10/deploy-azure-workbook-and-app-insights-function/)
- [Replace placeholders in string with user-defined Bicep function](https://ronaldbosma.github.io/blog/2024/06/21/replace-placeholders-in-string-with-user-defined-bicep-function/)
