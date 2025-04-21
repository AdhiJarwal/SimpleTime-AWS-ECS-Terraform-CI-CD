variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "simpletimeservice"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones to deploy resources in"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "container_image" {
  description = "Docker image to run in the ECS cluster"
  type        = string
  default     = "adhijrwl/simpletimeservice:latest"
}

variable "container_port" {
  description = "Port exposed by the Docker image"
  type        = number
  default     = 8080
}

variable "task_cpu" {
  description = "CPU units to allocate to the ECS task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory to allocate to the ECS task"
  type        = number
  default     = 512
}

variable "app_count" {
  description = "Number of Docker containers to run"
  type        = number
  default     = 1
}