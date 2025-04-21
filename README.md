# Terraform AWS Infrastructure Setup

This repository contains Terraform configurations for setting up AWS services, including ECS, VPC, S3, and more. The setup is modular, with separate modules for various components like ECS clusters, VPC setup, and logging.

## Directory Structure
DEVOPS-CHALLENGE
├── app.py
├── Dockerfile
├── requirements.txt
├── terraform
│   ├── modules
│   │   ├── ecs
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── resource
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── variables.tf


## Modules Overview

### `ecs-cluster`
- **Purpose**: Creates an ECS cluster and deploys containers using Docker images.
- **Resources**: ECS cluster, task definition, service, load balancer.

### `vpc-subnet-sg`
- **Purpose**: Creates a VPC along with its networking components like public/private subnets and security groups.

### `s3-bucket`
- **Purpose**: Creates an S3 bucket for storage needs.

## Root Directory (`resource/`)

- **`main.tf`**: Main entry point that calls the modules.
- **`provider.tf`**: Configures AWS provider settings.
- **`variables.tf`**: Defines input variables for the entire infrastructure.
- **`outputs.tf`**: Outputs the IDs and DNS names of created resources.
- **`terraform.tfvars`**: Provides specific values for the variables.

## Usage

1. **Initialize Terraform**: Run `terraform init` to download the required providers.
2. **Review Plan**: Use `terraform plan` to preview the changes.
3. **Apply**: Run `terraform apply` to create resources.
4. **Destroy**: Use `terraform destroy` to tear down the infrastructure.

