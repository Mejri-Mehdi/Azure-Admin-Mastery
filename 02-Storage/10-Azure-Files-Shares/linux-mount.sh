#!/bin/bash
# Mount Azure file share on Linux
STG_ACCT="filestgxyz123"
RG="rg-file-share"
SHARE="shared-docs"
MOUNT_POINT="/mnt/shared-docs"

# Check if credentials file already exists; if not, create it manually with key
CRED_FILE="/etc/smbcredentials/$STG_ACCT.cred"
if [ ! -f "$CRED_FILE" ]; then
    echo "Credentials file missing. Please provide the storage account key."
    echo "Run the following command manually, replacing YOUR_KEY:"
    echo "echo -e \"username=$STG_ACCT\npassword=YOUR_KEY\" | sudo tee $CRED_FILE"
    echo "sudo chmod 600 $CRED_FILE"
    exit 1
fi

sudo apt update && sudo apt install cifs-utils -y
sudo mkdir -p $MOUNT_POINT
sudo mount -t cifs //$STG_ACCT.file.core.windows.net/$SHARE $MOUNT_POINT -o credentials=$CRED_FILE,serverino,nosharesock,actimeo=30,file_mode=0777,dir_mode=0777
echo "Mounted $SHARE at $MOUNT_POINT"