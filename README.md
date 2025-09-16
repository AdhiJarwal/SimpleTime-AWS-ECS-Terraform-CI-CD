#  SimpleTimeService — Terraform AWS Infrastructure & CI/CD Pipeline

This repository sets up and deploys a simple time-based service using **Terraform** and **GitHub Actions** on **AWS ECS**. It includes modular infrastructure, Dockerized app deployment, and GitHub Actions workflows for CI/CD.

---

##  Directory Structure

```
simpletimeservice
├── .github
│   ├── workflows
│   │   ├── README.md
│   │   ├── simpletimeservice-deploy.yaml
│   │   ├── simpletimeservice-destroy.yaml
├── app
│   ├── app.py
│   ├── Dockerfile
│   ├── README.md
│   ├── requirements.txt
├── terraform
│   ├── modules
│   │   ├── ecs
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── README.md
│   │   │   └── variables.tf
│   │   └── vpc
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── README.md
│   │       └── variables.tf
│   ├── resource
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── README.md
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── README.md

```

---

##  Infrastructure Overview (Terraform)

This project creates and manages the following AWS resources:

-  **ECS Cluster** and Task Definition
-  **Application Load Balancer**
-  **VPC with Public/Private Subnets**
-  **Security Groups**
-  **S3 for Terraform state** (with locking via DynamoDB)
-  **IAM Roles & Policies**

###  Modules

#### `ecs-cluster`
- Provisions ECS cluster, task definition, service, ALB.

#### `vpc-subnet-sg`
- Sets up VPC, subnets, and security groups.

###  `terraform/resource/` Overview

- **`main.tf`** – Main entry point that calls the modules.
- **`backend.tf`** – Stores state in S3 & locks with DynamoDB.
- **`provider.tf`** – AWS provider configuration.
- **`variables.tf`** – Declares all variables used in infra.
- **`outputs.tf`** – Outputs for ALB DNS, ECS cluster, etc.
- **`terraform.tfvars`** – Actual values for declared variables.

---

## ⚙️ CI/CD: GitHub Actions

This project uses GitHub Actions to automate Docker builds and Terraform-based deployment.

###  Workflows

#### 1. **Build & Deploy** → `.github/workflows/simpletimeservice-deploy.yaml`
Triggered on:
- Push to `main`
- Pull Request to `main`

Jobs:
-  `docker-build-push`: Builds Docker image and pushes to DockerHub
-  `terraform-apply`: Provisions AWS infrastructure and deploys app

#### 2. **Destroy Infra** → `.github/workflows/simpletimeservice-destroy.yaml`
Triggered manually via GitHub UI

Jobs:
-  `terraform-destroy`: Tears down all resources

---

##  GitHub Secrets Required

Go to `Settings > Secrets and variables > Actions` and add:

| Name                    | Description               |
| ----------------------- | ------------------------- |
| `AWS_ACCESS_KEY_ID`     | AWS IAM user's access key |
| `AWS_SECRET_ACCESS_KEY` | AWS IAM user's secret key |
| `DOCKER_USERNAME`       | DockerHub username        |
| `DOCKER_PASSWORD`       | DockerHub password/token  |

---

##  How to Run Workflows

###  Automatic Deployment (via Push)
```bash
git add .
git commit -m "Update app"
git push origin main
```

###  Manual Deployment (via UI)
1. Go to **GitHub → Actions**
2. Select **SimpleTimeService - Build and Deploy**
3. Click **Run workflow**
4. Select branch and deploy

###  Destroy Infrastructure (Manual)
1. Go to **GitHub → Actions**
2. Select **SimpleTimeService - Cleanup Infrastructure**
3. Click **Run workflow** → Confirm

---

##  Local Development (Optional)

```bash
# Navigate to terraform resource directory
cd terraform/resource

# Initialize
terraform init

# See plan
terraform plan

# Apply changes
terraform apply

# To destroy manually
terraform destroy
```
----------