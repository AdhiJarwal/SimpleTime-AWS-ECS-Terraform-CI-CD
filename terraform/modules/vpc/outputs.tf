output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.simpletimeservice_vpc.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.simpletimeservice_public[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.simpletimeservice_private[*].id
}
