#!/bin/bash
# deploy-vm.sh: Deploy Windows and Linux VMs using Azure CLI (explicit resource creation)
# Usage: bash deploy-vm.sh

set -euo pipefail

# ----- Variables -----
RESOURCE_GROUP="rg-compute-lab"
LOCATION="eastus"
VNET_NAME="vnet-compute-lab"
SUBNET_NAME="snet-default"
NSG_NAME="nsg-compute-lab"
WIN_VM_NAME="winvm-cli"
LINUX_VM_NAME="linuxvm-cli"
ADMIN_USER="azureadmin"
ADMIN_PASSWORD="YourComplexP@ssw0rd!"   # Change this!
LINUX_USER="azureuser"

echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating virtual network and subnet..."
az network vnet create \
  --resource-group $RESOURCE_GROUP \
  --name $VNET_NAME \
  --address-prefix 10.3.0.0/16 \
  --subnet-name $SUBNET_NAME \
  --subnet-prefix 10.3.0.0/24

echo "Creating Network Security Group..."
az network nsg create --resource-group $RESOURCE_GROUP --name $NSG_NAME

echo "Adding NSG rules for RDP and SSH..."
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME --name AllowRDP --priority 100 --direction Inbound --access Allow --protocol Tcp --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 3389
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME --name AllowSSH --priority 101 --direction Inbound --access Allow --protocol Tcp --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 22

echo "Associating NSG with subnet..."
az network vnet subnet update --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $SUBNET_NAME --network-security-group $NSG_NAME

echo "Creating public IP addresses..."
az network public-ip create --resource-group $RESOURCE_GROUP --name winvm-pip --sku Standard --allocation-method Static
az network public-ip create --resource-group $RESOURCE_GROUP --name linuxvm-pip --sku Standard --allocation-method Static

echo "Creating network interfaces..."
az network nic create --resource-group $RESOURCE_GROUP --name winvm-nic --vnet-name $VNET_NAME --subnet $SUBNET_NAME --public-ip-address winvm-pip
az network nic create --resource-group $RESOURCE_GROUP --name linuxvm-nic --vnet-name $VNET_NAME --subnet $SUBNET_NAME --public-ip-address linuxvm-pip

echo "Creating Windows VM (Win2022Datacenter)..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $WIN_VM_NAME \
  --size Standard_F1ads_v7 \
  --image Win2022Datacenter \
  --admin-username $ADMIN_USER \
  --admin-password $ADMIN_PASSWORD \
  --nics winvm-nic \
  --os-disk-size-gb 127 \
  --storage-sku StandardSSD_LRS \
  --boot-diagnostics-storage ""

echo "Creating Linux VM (Ubuntu 22.04)..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $LINUX_VM_NAME \
  --size Standard_F1ads_v7 \
  --image Ubuntu2204 \
  --admin-username $LINUX_USER \
  --generate-ssh-keys \
  --nics linuxvm-nic \
  --os-disk-size-gb 30 \
  --storage-sku StandardSSD_LRS \
  --boot-diagnostics-storage ""

echo "Deployment complete!"
echo "Windows VM public IP:"
az network public-ip show --resource-group $RESOURCE_GROUP --name winvm-pip --query ipAddress -o tsv
echo "Linux VM public IP:"
az network public-ip show --resource-group $RESOURCE_GROUP --name linuxvm-pip --query ipAddress -o tsv