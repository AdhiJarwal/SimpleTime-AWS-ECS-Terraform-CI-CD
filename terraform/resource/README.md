# AWS Infrastructure Setup

## Overview

This Terraform configuration sets up an AWS infrastructure for hosting ECS services. It provisions the necessary networking resources such as VPC, subnets, and security groups. Additionally, it handles the creation of an ECS cluster and integrates it with load balancers for routing traffic.

## Modules

### `vpc-subnet-sg`
- **Source**: `../modules/vpc-subnet-sg`
- **Description**: This module creates the VPC and networking components such as public and private subnets, security groups, and route tables.

### `ecs-cluster`
- **Source**: `../modules/ecs-cluster`
- **Description**: This module sets up an ECS cluster, defines ECS tasks, and deploys ECS services.

## Variables

| Variable Name         | Type         | Description                               |
| --------------------- | ------------ | ----------------------------------------- |
| `vpc_cidr_block`      | string       | The CIDR block for the VPC.               |
| `public_subnet_cidr`  | list(string) | CIDR blocks for public subnets.           |
| `private_subnet_cidr` | list(string) | CIDR blocks for private subnets.          |
| `cluster_name`        | string       | Name of the ECS cluster to be created.    |
| `task_cpu`            | number       | CPU units for ECS tasks.                  |
| `task_memory`         | number       | Memory for ECS tasks.                     |
| `container_image`     | string       | The Docker image to be used in ECS tasks. |
| `container_port`      | number       | Port that the container listens on.       |

## Outputs

| Output Name         | Description                                       |
| ------------------- | ------------------------------------------------- |
| `ecs_cluster_name`  | The name of the ECS cluster created.              |
| `load_balancer_dns` | DNS name of the load balancer configured for ECS. |
| `vpc_id`            | The ID of the VPC created.                        |
| `public_subnet_ids` | The IDs of the public subnets created.            |
