resource "aws_ecr_repository" "ecr_repository_aeis" {
  name = "test-infra-repository-image-aeis"
}

output "url_ecr_repository_aeis" {
  value = aws_ecr_repository.ecr_repository_aeis.repository_url
}
