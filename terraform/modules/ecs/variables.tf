variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "simpletimeservice"
}

variable "aws_region" {
  description = "AWS region where the resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC where ECS resources will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ECS load balancer"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "container_image" {
  description = "The container image URL to run in ECS tasks"
  type        = string
}

variable "container_port" {
  description = "The port exposed by the container"
  type        = number
  default     = 8080
}

variable "task_cpu" {
  description = "The CPU units allocated for the ECS task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "The amount of memory (in MB) allocated for the ECS task"
  type        = number
  default     = 512
}

variable "app_count" {
  description = "The number of ECS tasks to run"
  type        = number
  default     = 1
}
