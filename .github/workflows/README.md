# GitHub Actions Workflows

This repository contains two GitHub Actions workflows for managing the SimpleTimeService infrastructure deployment and cleanup.

## Prerequisites

Before running these workflows, ensure you have:

1. **GitHub Secrets Configuration**:
AWS_ACCESS_KEY_ID  
AWS_SECRET_ACCESS_KEY    
DOCKER_USERNAME   
DOCKER_PASSWORD


## How to Run

### Deploy Workflow (`simpletimeservice-deploy.yaml`)

#### Automatic Deployment
The deployment workflow triggers automatically when you:
- Push to the `main` branch
- Create a pull request to the `main` branch

```bash
# Deploy Process (Automatic via git push)
git add .
git commit -m "Update application code"
git push origin main

# The workflow will automatically start in GitHub Actions

To Destroy Infrastructure

# To Destroy (Manual via GitHub UI)
1. Navigate to Actions tab
2. Click "SimpleTimeService - Cleanup Infrastructure"
3. Click "Run workflow"
4. Confirm and monitor the destruction process

