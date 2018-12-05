$StorageAccountName = "testacntimages"
$StorageAccountKey = "/Gi6pLRMP/kkaDcnmfKK681aWldPYCr84lhZURXEaU/6bXkvXmpDL0pxYWCccOVjrFoeHfUKC0Qe980rAgrcnA=="
$ContainerName = "images"
$sourceFileRootDirectory = "D:\Workspace\AzureStorage\AzureBlobUploads" # i.e. D:\Docs

function Upload-FileToAzureStorageContainer {
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
   
    $container = New-AzureStorageContainer -Name $ContainerName -Context $ctx -Permission Blob
    }
    else
    {
      $container = Get-AzureStorageContainer -Name $ContainerName -Context $ctx 
     
    }

    $container.CloudBlobContainer.Uri.AbsoluteUri
    if ($container) {
        $filesToUpload = Get-ChildItem $sourceFileRootDirectory -Recurse -File

        foreach ($x in $filesToUpload) {
            $targetPath = ($x.fullname.Substring($sourceFileRootDirectory.Length + 1)).Replace("\", "/")

            Write-Verbose "Uploading $("\" + $x.fullname.Substring($sourceFileRootDirectory.Length + 1)) to $($container.CloudBlobContainer.Uri.AbsoluteUri + "/" + $targetPath)"
            Set-AzureStorageBlobContent -File $x.fullname -Container $container.Name -Blob $targetPath -Context $ctx -Force:$Force | Out-Null
        }
    }
}

Upload-FileToAzureStorageContainer -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey -ContainerName $ContainerName -sourceFileRootDirectory $sourceFileRootDirectory -Verbose