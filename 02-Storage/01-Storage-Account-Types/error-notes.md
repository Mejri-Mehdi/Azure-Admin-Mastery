# Error Notes

## 1. Creating a File Share in a Premium Block Blobs account (`premblk`)
- **Command**: `az storage share create --account-name premblk... --name testshare`
- **Error**: `The operation is not supported for a storage account of kind BlockBlobStorage.`
- **Reason**: The `BlockBlobStorage` kind only supports block blobs; it does not provide file shares. To use Azure Files, you must deploy a general‑purpose v2 or a FileStorage account.

## 2. Creating a Page Blob in Standard v2 (`stdv2lrs`) – Expected Behavior
- **Operation**: Creating a page blob container and uploading a page blob is allowed.
- **Result**: The operation succeeded (if a valid file was provided). However, page blobs in a Standard v2 account are not optimised; they use standard hard drives (HDD) which are slower and can be throttled. For production page blobs (used as disks for VMs), you would use Premium page blobs (now typically replaced by Managed Disks) or Ultra Disk Storage.
- **Note**: Page blobs are not supported on GRS replication; they require LRS or ZRS.

## 3. Attempting to create a Blob container in a FileStorage account (if tested)
- **Error**: Similar to the first – `FileStorage` accounts only support file shares, not blobs.