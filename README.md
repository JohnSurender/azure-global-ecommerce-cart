📘 Azure Container Apps Deployment with ACR & Bicep 

This project demonstrates a modern, cloud‑native container deployment using:

Azure Container Apps

Azure Container Registry (ACR)

Bicep Infrastructure‑as‑Code

Log Analytics for monitoring

It showcases a complete workflow from container build → push → deploy, using Azure’s serverless container platform.

🌍 Architecture Overview
This solution deploys:

Azure Container Registry (ACR) to store container images

Azure Container Apps Environment

A Container App running your image

Log Analytics Workspace for logs and metrics

Optional VNet integration for secure networking

This architecture supports:

Serverless container hosting

Automatic scaling

Secure image pulls

Centralized logging

Modern IaC with Bicep

The full diagram is available in:
architecture/container-apps-architecture.mmd

🏗 Components
1. Azure Container Registry (ACR)
Stores container images

Integrated with Container Apps for secure pulls

Supports build automation

2. Azure Container Apps Environment
Serverless container runtime

Handles scaling, revisions, and traffic splitting

3. Container App
Runs your container image

Pulls from ACR using managed identity

Exposes HTTP endpoint

4. Log Analytics Workspace
Collects logs, metrics, and diagnostics

Enables deep monitoring

🚀 Deployment Steps
1. Build and Push Image to ACR
bash
az acr build \
  --registry <acrName> \
  --image sampleapp:v1 \
  .
2. Deploy Infrastructure (Bicep)
bash
az deployment group create \
  --resource-group rg-containerapp \
  --template-file main.bicep \
  --parameters parameters.json
3. Update Container App to New Image
bash
az containerapp update \
  --name sampleapp \
  --resource-group rg-containerapp \
  --image <acrName>.azurecr.io/sampleapp:v1
🔐 Security Features
ACR integrated with Container Apps using managed identity

No admin credentials required

Optional VNet integration for private networking

Logs stored securely in Log Analytics

Bicep ensures consistent, repeatable deployments

📄 Files in This Project

| File | Description |
| --- | --- |
| ``main.bicep`` | Main Bicep IaC template |
| ``parameters.json`` | Deployment parameters |
| ``scripts/deploy.sh`` | One‑command deployment script |
| ``Dockerfile`` | Container build instructions |
| ``architecture/container-apps-architecture.mmd`` | Architecture diagram |
| ``docs/overview.md`` | Full project documentation |

🎯 Learning Outcomes
By completing this project, you demonstrate:

Containerization fundamentals

ACR image management

Azure Container Apps deployment

Bicep IaC authoring

Log Analytics integration

Modern cloud‑native architecture

🧩 Next Steps
Enhance this project by adding:

GitHub Actions CI/CD pipeline

Multiple microservices

Dapr integration

Private ACR endpoints

Autoscaling rules (KEDA)
