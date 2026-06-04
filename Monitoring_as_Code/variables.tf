variable "kube_config_path" {
  type        = string
  description = "Path to kubeconfig file — set via TF_VAR_kube_config_path"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key — set via TF_VAR_datadog_api_key"
  sensitive   = true
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key — set via TF_VAR_datadog_app_key"
  sensitive   = true
}

variable "datadog_site" {
  type        = string
  description = "Datadog site URL (e.g. us5.datadoghq.com)"
}

variable "datadog_api_url" {
  type        = string
  description = "Datadog API URL (e.g. https://api.datadoghq.com)"
}

variable "application_name" {
  type        = string
  description = "Name of the application"
}

variable "env" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "env must be dev or prod."
  }
}

variable "replicas" {
  type        = number
  description = "Number of pod replicas"
}

variable "pod_alert_critical" {
  type        = number
  description = "Pod count threshold for critical alert"
}

variable "pod_alert_warning" {
  type        = number
  description = "Pod count threshold for warning alert"
}
