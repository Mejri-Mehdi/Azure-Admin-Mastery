#!/bin/bash
# 00-F02: Azure CLI Setup – all commands run during the exercise

# 1. Install Azure CLI (already done, documented in setup.md)

# 2. Login using device code flow
az login

# 3. List all subscriptions and note the default flag
az account list --output table

# 4. Set the active subscription (use your actual subscription name)
az account set --subscription "Your-Subscription-Name"

# 5. List resource groups
az group list --output table

# 6. Configure CLI defaults (group and location)
az configure --defaults group=your-rg location=eastus

# 7. List available VM SKUs for the 'Standard_B' family in eastus
az vm list-skus --location eastus --size Standard_B --output table

# 8. Display Azure CLI version and installed extensions
az --version