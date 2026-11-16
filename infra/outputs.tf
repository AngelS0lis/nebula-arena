output "cluster" {
  description = "Nombre del clúster EKS"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint del clúster EKS"
  value       = module.eks.cluster_endpoint
}

output "registro" {
  description = "URI del repositorio ECR"
  value       = aws_ecr_repository.imagenes.repository_url
}
