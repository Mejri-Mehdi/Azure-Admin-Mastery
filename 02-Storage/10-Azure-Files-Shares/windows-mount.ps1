# Mount Azure file share on Windows
$storageAccountName = "filestgxyz123"
$resourceGroup = "rg-file-share"
$shareName = "shared-docs"
$key = az storage account keys list --account-name $storageAccountName -g $resourceGroup --query "[0].value" -o tsv
net use Z: \\$storageAccountName.file.core.windows.net\$shareName /persistent:yes /user:Azure\$storageAccountName $key
Write-Host "Mounted as Z:"