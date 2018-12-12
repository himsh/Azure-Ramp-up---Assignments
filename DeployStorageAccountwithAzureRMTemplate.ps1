
[cmdletbinding()]
 param(
        [Parameter(Mandatory = $false, Position = 0)]
        $location = "eastus",

        [Parameter(Mandatory = $true, Position = 2)]
        $ResourceGroupName
        
    )

#Connect-AzureRmAccount

Set-AzureRmontext -SubscriptionID "73f4e20a-fbc9-40df-b43b-bf5253547da4"

Get-AzureRmResourceGroup -Name  $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue

if ($notPresent)
{
  New-AzureRmResourceGroup -Name  $ResourceGroupName -Location $location
}
else
{
    # ResourceGroup exist
}


New-AzureRmResourceGroupDeployment -Name StorageAccountDeployment -ResourceGroupName $ResourceGroupName `
-TemplateFile "D:\Workspace\Github- Repos\Azure-Ramp-up-Assignments\ARM Templates\azurestorageaccountdeploy.json" 
#-TemplateParameterFile ".\ARM Templates\azurestorageaccountdeploy.parameters.json"