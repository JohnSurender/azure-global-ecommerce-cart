📄 Project Documentation — Azure Container Apps with ACR & Bicep
1. Overview
This project deploys a modern, cloud‑native container architecture using:

Azure Container Apps

Azure Container Registry (ACR)

Bicep Infrastructure‑as‑Code

Log Analytics Workspace

It demonstrates a complete workflow from container build → push → deploy, using Azure’s serverless container platform.

2. Architecture Summary
The solution includes:

Azure Container Registry (ACR) to store container images

Azure Container Apps Environment

Container App running your image

Log Analytics Workspace for logs and metrics

Optional VNet integration for secure networking

This architecture supports:

Serverless container hosting

Automatic scaling

Secure image pulls using Managed Identity

Centralized logging

Modern IaC with Bicep

The full diagram is available in:
architecture/container-apps-architecture.mmd

3. Deployment Flow
Build container image locally or via ACR Tasks

Push image to ACR

Deploy infrastructure using Bicep

Container App pulls image from ACR using Managed Identity

Logs flow into Log Analytics Workspace

Container App scales automatically based on demand

4. Security Considerations
ACR admin user disabled

Container App uses System‑Assigned Managed Identity to pull images

No credentials stored in code

Optional VNet integration for private networking

Logs stored securely in Log Analytics

Bicep ensures consistent, repeatable deployments

This architecture follows modern cloud‑native security best practices.

5. Cost Estimation (Approx.)
6. | Component | Quantity | Estimated Monthly Cost |
| --- | --- | --- |
| Container App | 1 | ~£5–£10 (usage‑based) |
| ACR (Basic) | 1 | ~£4–£5 |
| Log Analytics | 1 | ~£2–£3 |
| Container Apps Environment | 1 | Included in usage |
| VNet (optional) | 1 | Free |
Estimated total: ~£10–£18 per month
(Varies by usage and region)

6. Troubleshooting
Container App not starting
Check image exists in ACR

Ensure image tag matches imageName parameter

Verify ACR → Container App role assignment

Image pull errors
Confirm Managed Identity is enabled

Check ACR role assignment (AcrPull)

Ensure ACR admin user is disabled

Logs not appearing
Verify Log Analytics Workspace is deployed

Check Container Apps Environment log configuration

Use:
az containerapp logs show

Deployment errors
Run validation:
az deployment group validate

Ensure ACR name is globally unique

Check Bicep syntax

7. Future Enhancements
Add GitHub Actions CI/CD pipeline

Add multiple microservices

Integrate Dapr for service‑to‑service communication

Add private ACR endpoint

Add autoscaling rules (KEDA)

Add API gateway (Azure API Management)
