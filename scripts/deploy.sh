#!/bin/bash

RESOURCE_GROUP="rg-containerapp"
LOCATION="uksouth"

echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Deploying Bicep template..."
az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file main.bicep \
  --parameters @parameters.json

echo "Deployment complete."
