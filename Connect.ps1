# To make sure the Azure PowerShell module is available after you install
#Get-Module –ListAvailable 

# To log in to Azure Resource Manager
Login-AzureRmAccount

# You can also use a specific Tenant if you would like a faster log in experience
# Login-AzureRmAccount -TenantId xxxx

# To view all subscriptions for your account
Get-AzureRmSubscription

# To select a default subscription for your current session
Get-AzureRmSubscription –SubscriptionName “Бесплатная пробная версия” | Select-AzureRmSubscription

# View your current Azure PowerShell session context
# This session state is only applicable to the current session and will not affect other sessions
Get-AzureRmContext

# To select the default storage context for your current session
Set-AzureRmCurrentStorageAccount –ResourceGroupName "testRG" –StorageAccountName "aborozenetsstorage"

# View your current Azure PowerShell session context
# Note: the CurrentStorageAccount is now set in your session context
Get-AzureRmContext

# To list all of the blobs in all of your containers in all of your accounts
Get-AzureRmStorageAccount | Get-AzureStorageContainer | Get-AzureStorageBlob


###############################

#Create the resources with the template and parameters
$templateFile = "C:\Users\Andrew\Desktop\Azure\Scripts\template.json"
$parameterFile = "C:\Users\Andrew\Desktop\Azure\Scripts\parameters.json"

New-AzureRmResourceGroupDeployment -Name "testRG-delpoy" -ResourceGroupName "testRG" -TemplateParameterFile $parameterFile -TemplateFile $templateFile -Verbose 

#New-AzureRmResourceGroupDeployment -Name "testRG03-deploy" -ResourceGroupName "testRG03" -TemplateUri https://raw.githubusercontent.com/azure/azure-quickstart-templates/master/101-vm-customdata/azuredeploy.json

###############################
