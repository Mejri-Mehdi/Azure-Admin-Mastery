#!/bin/bash
# 00-F06: Create resource groups with tags

# Production
az group create `
  -n rg-prod-app01 `
  -l eastus `
  --tags Environment=Production CostCenter=IT-001 Owner=admin@contoso.com

# Development
az group create `
  -n rg-dev-app01 `
  -l eastus `
  --tags Environment=Development CostCenter=IT-002 Owner=devteam@contoso.com

# Sandbox
az group create `
  -n rg-sandbox-test `
  -l eastus `
  --tags Environment=Sandbox CostCenter=IT-003 Owner=labuser@contoso.com

echo "All resource groups created and tagged."