output "alb_hostname" {
  description = "Hostname of the ALB"
  value       = aws_lb.simpletimeservice_alb.dns_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.simpletimeservice_cluster.name
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.simpletimeservice_service.name
}
