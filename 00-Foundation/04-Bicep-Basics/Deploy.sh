#!/bin/bash
# Deploy the Bicep template to the specified resource group

az deployment group create `
  --resource-group AZ-900-FR `
  --template-file main.bicep `
  --parameters storageAccountName=mehdi2026stg98765