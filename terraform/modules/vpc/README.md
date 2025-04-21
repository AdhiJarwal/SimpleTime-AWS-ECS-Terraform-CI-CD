# VPC Module

## Overview

This module provisions the essential networking resources for your AWS infrastructure, including a Virtual Private Cloud (VPC), subnets, security groups, route tables, and NAT gateways. It is designed to enable secure and scalable networking for other modules like ECS.

## Resources

| Resource Name               | Description                                  |
| --------------------------- | -------------------------------------------- |
| `aws_vpc.vpc`               | Creates a VPC with the specified CIDR block. |
| `aws_subnet.public_subnet`  | Creates public subnets within the VPC.       |
| `aws_subnet.private_subnet` | Creates private subnets within the VPC.      |
| `aws_security_group.sg`     | Creates a security group for the VPC.        |
| `aws_internet_gateway.igw`  | Creates an internet gateway for the VPC.     |
| `aws_nat_gateway.nat_gw`    | Creates a NAT gateway for the VPC.           |

## Variables

| Variable Name                | Type         | Description                                           |
| ---------------------------- | ------------ | ----------------------------------------------------- |
| `vpc_cidr_block`             | string       | The CIDR block for the VPC.                           |
| `public_subnet_cidr_blocks`  | list(string) | CIDR blocks for the public subnets.                   |
| `private_subnet_cidr_blocks` | list(string) | CIDR blocks for the private subnets.                  |
| `availability_zones`         | list(string) | Availability zones for creating subnets.              |
| `enable_dns_support`         | bool         | Whether DNS support should be enabled for the VPC.    |
| `enable_dns_hostnames`       | bool         | Whether DNS hostnames should be enabled for the VPC.  |
| `instance_tenancy`           | string       | The tenancy option for instances launched in the VPC. |
| `tags_vpc`                   | map(string)  | Tags to assign to the VPC resources.                  |

## Outputs

| Output Name           | Description                                         |
| --------------------- | --------------------------------------------------- |
| `vpc_id`              | The ID of the VPC created.                          |
| `public_subnet_ids`   | List of public subnet IDs.                          |
| `private_subnet_ids`  | List of private subnet IDs.                         |
| `security_group_id`   | The ID of the security group created for the VPC.   |
| `internet_gateway_id` | The ID of the internet gateway created for the VPC. |
| `nat_gateway_id`      | The ID of the NAT gateway created for the VPC.      |
