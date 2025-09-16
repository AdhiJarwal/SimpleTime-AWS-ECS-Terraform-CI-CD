# Terraform Resources

Main Terraform configuration that orchestrates the infrastructure deployment.

## Files

- `main.tf` - Module calls and resource definitions
- `variables.tf` - Input variable declarations
- `outputs.tf` - Output value definitions
- `providers.tf` - AWS provider configuration
- `backend.tf` - S3 backend configuration
- `terraform.tfvars` - Variable values (excluded from git)

## Usage

```bash
# Initialize
terraform init

# Plan changes
terraform plan

# Apply infrastructure
terraform apply

# Destroy resources
terraform destroy
```

## Modules Used

- `../modules/vpc` - VPC and networking
- `../modules/ecs` - ECS cluster and services