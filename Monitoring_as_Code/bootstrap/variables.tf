variable "aws_region" {
  type        = string
  description = "AWS region where the state bucket and lock table will be created"
  default     = "eu-west-1"
}

variable "gitlab_namespace" {
  type        = string
  description = "GitLab username or group name (e.g. my-username)"
}

variable "gitlab_project" {
  type        = string
  description = "GitLab project/repo name (e.g. monitoring-as-code)"
}
