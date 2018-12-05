$StorageAccountName = "testacntimages"
$StorageAccountKey = "/Gi6pLRMP/kkaDcnmfKK681aWldPYCr84lhZURXEaU/6bXkvXmpDL0pxYWCccOVjrFoeHfUKC0Qe980rAgrcnA=="
$ContainerName = "images"
$sourceFileRootDirectory = "D:\Workspace\AzureStorage\AzureBlobDownload" 

function Download-FileFromAzureStorageContainer {
    [cmdletbinding()]
    param(
        $StorageAccountName,
        $StorageAccountKey,
        $ContainerName,
        $sourceFileRootDirectory,
        $Force
    )

    $ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
    if (!(Get-AzureStorageContainer -Context $ctx | Where-Object { $_.Name -eq $ContainerName })){
      Write-Output ("Container: $ContainerName in Storage Account: $StorageAccountName does not exist.")
        #$container = New-AzureStorageContainer -Name $ContainerName -Context $ctx -Permission Blob
    }
    else
    {
      $container = Get-AzureStorageContainer -Name $ContainerName -Context $ctx 
     
    }

    
        $filesToDownload =  Get-AzureStorageBlob -Container $ContainerName -Context $ctx

        foreach ($x in $filesToDownload) {
           

           Write-Verbose "Downloading blob $x.Name to $sourceFileRootDirectory"
           Get-AzureStorageBlobContent -Container $ContainerName -Blob $x.Name -Destination $sourceFileRootDirectory -Context $ctx -Force:$Force 
       
    }
}

Download-FileFromAzureStorageContainer -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey -ContainerName $ContainerName -sourceFileRootDirectory $sourceFileRootDirectory -Verbose