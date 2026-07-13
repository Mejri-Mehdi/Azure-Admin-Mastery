#!/bin/bash
# 00-F05: ARM Template Basics – deployment commands

# Deploy the storage account with blob service (resource group scope)
az deployment group create `
  --resource-group AZ-900-FR `
  --template-file template.json `
  --parameters storageAccountName=mehdi2026stg98765

# Deploy a new resource group (subscription scope)
az deployment sub create `
  --location eastus `
  --template-file rg-template.json `
  --parameters rgName=arm-demo-rg location=eastus