# Install Azure ARM to use Azure Cmdlets, commenting for now as already installed.
#Install-module AzureRM

# login to the  AzureRMAccount to get the subscription
login-azureRmaccount

#set AzureRmContext
Get-AzureRmContext

#set Azure RM context 
Set-AzureRmontext -SubscriptionID "73f4e20a-fbc9-40df-b43b-bf5253547da4"
