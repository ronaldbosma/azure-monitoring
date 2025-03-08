# APIM Requests Workbook

The workbook [APIM Requests.workbook](./APIM%20Requests.workbook) can be used to view the requests made to Azure API Management. See the screenshot below for an example:

![APIM Requests Workbook screenshot](./APIM%20Requests.png)


## Deployment

### Manual Deployment

Follow these steps to manually deploy the workbook:

1. Navigate to your **Application Insights** resource in the **Azure Portal**.
2. Open the **Workbooks** screen.
3. Click on the **+ New** button.
4. Click the **`</>`** button.
5. Ensure the **Gallery Template** tab is selected.
6. Paste the contents of [APIM Requests.workbook](./APIM%20Requests.workbook) into the editor.
7. Click the **Apply** button.
8. Click the **Save** button.
9. Specify a **Title** and configure the correct **Subscription, Resource Group** and **Location** to save the workbook.
10. Click the **Save As** button.

### Deployment via Bicep

You can follow the guide [Deploy Azure Workbook and App Insights Function](https://ronaldbosma.github.io/blog/2023/03/10/deploy-azure-workbook-and-app-insights-function/) to deploy the workbook using **Bicep**.

By default, the **Azure Subscription** and **Application Insights** parameters are empty. When deploying the workbook, you may want to specify these parameters. There are several approaches:

1. Use a placeholder value for both parameters and set them during deployment. You can hide these parameters in reading mode by setting the `Hide parameter in reading mode` property to `true`.
2. Remove the parameters from the workbook. Some parameters and the table reference the **Application Insights** parameter using the `{ApplicationInsights}` syntax. Replace this with the **Application Insights resource ID** during deployment.

For an example of how to use placeholders in a workbook during deployment, see:  
[Deploy Azure Workbook and App Insights Function](https://ronaldbosma.github.io/blog/2023/03/10/deploy-azure-workbook-and-app-insights-function/).


## Additional Resources

- [Azure Workbook Tips & Tricks](https://ronaldbosma.github.io/blog/2023/02/28/azure-workbook-tips-tricks/)
- [Deploy Azure Workbook and App Insights Function](https://ronaldbosma.github.io/blog/2023/03/10/deploy-azure-workbook-and-app-insights-function/)
