#!/bin/bash
# 03-11: ACR commands (run in PowerShell, saved as .sh for reference)

# Create ACR (Standard, admin enabled)
az acr create --name myacrxyz123 -g rg-acr-lab --location eastus --sku Standard --admin-enabled true

# Login
az acr login --name myacrxyz123

# Pull and tag nginx
docker pull nginx:latest
docker tag nginx:latest myacrxyz123.azurecr.io/nginx:v1

# Push
docker push myacrxyz123.azurecr.io/nginx:v1

# List images
az acr repository list --name myacrxyz123 -o table
az acr repository show-tags --name myacrxyz123 --repository nginx -o table

# Enable content trust policy
az acr config content-trust update --registry myacrxyz123 --status enabled

# (Optional) Sign image with Docker Content Trust
# export DOCKER_CONTENT_TRUST=1
# docker trust sign myacrxyz123.azurecr.io/nginx:v1

# Geo-replication
az acr replication create --registry myacrxyz123 --location westus2
az acr replication list --registry myacrxyz123 -o table