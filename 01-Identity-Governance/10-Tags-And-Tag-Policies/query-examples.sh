#!/bin/bash
# 01-10: Tag query examples

# 1. All resources with Environment=Production
az resource list --tag Environment=Production --output table

# 2. All resource groups with CostCenter=IT-001
az group list --tag CostCenter=IT-001 --output table

# 3. List VMs with their Owner tag
az vm list --query "[].{Name:name, Owner:tags.Owner}" --output table

# 4. Get all storage accounts in the subscription with their tags
az storage account list --query "[].{Name:name, Env:tags.Environment, Owner:tags.Owner}" --output table

# 5. Find resources missing the Environment tag (useful for remediation)
az resource list --query "[?tags.Environment==null].{Name:name, Type:type}" --output table