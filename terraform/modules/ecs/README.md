# ECS Module

## Overview

This module provisions an ECS (Elastic Container Service) cluster and sets up the required infrastructure for running Docker containers. It provides resources for defining ECS services and tasks and is integrated with the VPC setup for networking.

## Resources

| Resource Name                      | Description                                                            |
| ---------------------------------- | ---------------------------------------------------------------------- |
| `aws_ecs_cluster.ecs_cluster`      | Creates an ECS cluster.                                                |
| `aws_ecs_task_definition.task_def` | Defines an ECS task definition.                                        |
| `aws_ecs_service.ecs_service`      | Creates an ECS service to run Docker containers.                       |
| `aws_lb.load_balancer`             | Creates an Application Load Balancer to route traffic to ECS services. |
| `aws_security_group.sg`            | Creates a security group for the ECS instances.                        |

## Variables

| Variable Name        | Type         | Description                                                |
| -------------------- | ------------ | ---------------------------------------------------------- |
| `cluster_name`       | string       | The name of the ECS cluster.                               |
| `task_cpu`           | number       | CPU units to allocate to ECS tasks.                        |
| `task_memory`        | number       | Memory (in MB) to allocate to ECS tasks.                   |
| `container_image`    | string       | The Docker image to run in the ECS container.              |
| `container_port`     | number       | The port the container listens on.                         |
| `vpc_id`             | string       | VPC ID for deploying ECS resources.                        |
| `subnet_ids`         | list(string) | List of subnet IDs to place ECS instances.                 |
| `security_group_ids` | list(string) | List of security group IDs to assign to the ECS instances. |
| `desired_count`      | number       | The number of ECS tasks to run.                            |

## Outputs

| Output Name         | Description                                |
| ------------------- | ------------------------------------------ |
| `ecs_cluster_name`  | The name of the ECS cluster created.       |
| `ecs_service_name`  | The name of the ECS service created.       |
| `load_balancer_dns` | The DNS name of the created load balancer. |
