output "id" {
  value       = aws_ecr_repository.ecr.id
  description = "The registry ID where the repository was created."
}