
[cmdletbinding()]
 param(
        [Parameter(Mandatory = $false, Position = 0)]
        $location = "eastus",

        [Parameter(Mandatory = $true, Position = 2)]
        $ResourceGroupName
        
    )

#Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "Free Trial"


New-AzureRmResourceGroupDeployment -Name StorageAccountDeployment -ResourceGroupName $ResourceGroupName `
-TemplateFile "D:\Workspace\Github- Repos\Azure-Ramp-up-Assignments\ARM Templates\azurestorageaccountdeploy.json" 