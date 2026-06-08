output "environment" {
  value       = var.env
  description = "Active deployment environment"
}

output "workspace" {
  value       = terraform.workspace
  description = "Active Terraform workspace"
}

output "replicas" {
  value       = var.replicas
  description = "Number of pod replicas deployed"
}

output "namespace_app" {
  value       = kubernetes_namespace.sre_stack.metadata[0].name
  description = "Kubernetes namespace for the application"
}

output "namespace_monitoring" {
  value       = kubernetes_namespace.sre_stack_monitoring.metadata[0].name
  description = "Kubernetes namespace for the Datadog agent"
}

output "monitors" {
  description = "All active Datadog monitor IDs"
  value = {
    infrastructure = {
      node_cpu            = datadog_monitor.node_cpu.id
      node_memory         = datadog_monitor.node_memory.id
      node_disk           = datadog_monitor.node_disk.id
      node_network_errors = datadog_monitor.node_network_errors.id
    }
    kubernetes = {
      pod_health      = datadog_monitor.pod_health.id
      crashloopbackoff = datadog_monitor.crashloopbackoff.id
      pod_restarts    = datadog_monitor.pod_restarts.id
      pending_pods    = datadog_monitor.pending_pods.id
      oom_killed      = datadog_monitor.oom_killed.id
    }
    application = {
      http_5xx   = datadog_monitor.http_5xx.id
      latency_p95 = datadog_monitor.latency_p95.id
      no_traffic  = datadog_monitor.no_traffic.id
    }
  }
}
