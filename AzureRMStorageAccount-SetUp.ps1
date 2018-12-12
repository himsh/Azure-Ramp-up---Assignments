
 [cmdletbinding()]
 param(
        [Parameter(Mandatory = $false, Position = 0)]
        $location = "eastus",

        [Parameter(Mandatory = $true, Position = 1)]
        $StorageAccountName,

        [Parameter(Mandatory = $true, Position = 2)]
        $ResourceGroupName
        
    )


# Get list of locations and select one.
#Get-AzureRmLocation | select Location 
#$location = "eastus"

Set-AzureRmontext -SubscriptionID "73f4e20a-fbc9-40df-b43b-bf5253547da4"


if(!(Get-AzureRmresourceGroup -Name $ResourceGroupName -Location $location))
{
   New-AzureRmResourceGroup -Name $ResourceGroupName -Location $location 
}


# Set the name of the storage account and the SKU name. 
$storageAccountName =   $StorageAccountName
$skuName = "Standard_LRS"

# Create the storage account.
if(!(Get-AzureRmStorageAccount -ResourceGroupName $ResourceGroupName -Name $storageAccountName))
  {
     $storageAccount = New-AzureRmStorageAccount -ResourceGroupName $ResourceGroupName `
     -Name $storageAccountName `
     -Location $location `
     -SkuName $skuName

     # Retrieve the context. 
     $ctx = $storageAccount.Context

     Write-Host "Created the storage account $storageAccountName in Location $location"

  }
  else
  {
     Write-Host "\n Storage account already exists"
  }


  



