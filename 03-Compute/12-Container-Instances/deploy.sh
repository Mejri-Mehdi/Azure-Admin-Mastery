#!/bin/bash
# 03-12: Deploy Azure Container Instance
RESOURCE_GROUP="rg-aci-lab"
CONTAINER_NAME="nginx-container"
DNS_LABEL="myaci2026xyz"
LOCATION="eastus"

az group create --name $RESOURCE_GROUP --location $LOCATION

az container create \
  --resource-group $RESOURCE_GROUP \
  --name $CONTAINER_NAME \
  --image nginx:latest \
  --ports 80 \
  --dns-name-label $DNS_LABEL \
  --location $LOCATION

echo "Container FQDN:"
az container show -g $RESOURCE_GROUP -n $CONTAINER_NAME --query ipAddress.fqdn -o tsv