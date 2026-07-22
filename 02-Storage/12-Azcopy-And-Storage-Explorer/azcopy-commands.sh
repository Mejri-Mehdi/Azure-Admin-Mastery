#!/bin/bash
# AzCopy commands for 02-12 (run in PowerShell, but saved as .sh)

# Variables
STG="azcopystgxyz123"
SRC_SAS="?sv=...&se=...&sr=c&sp=rl&sig=..."
DEST_SAS="?sv=...&se=...&sr=c&sp=cw&sig=..."

# Copy all blobs from source container to dest container
azcopy copy "https://$STG.blob.core.windows.net/source/$SRC_SAS" "https://$STG.blob.core.windows.net/dest/$DEST_SAS" --recursive

# Synchronize (only changed/new files) from source to dest
azcopy sync "https://$STG.blob.core.windows.net/source/$SRC_SAS" "https://$STG.blob.core.windows.net/dest/$DEST_SAS"