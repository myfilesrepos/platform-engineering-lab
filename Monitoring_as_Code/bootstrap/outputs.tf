output "state_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "gitlab_ci_role_arn" {
  value       = aws_iam_role.gitlab_ci.arn
  description = "Set this as AWS_ROLE_ARN in GitLab CI/CD Variables"
}
