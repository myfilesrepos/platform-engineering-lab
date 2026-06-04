provider "kubernetes" {
  config_path = var.kube_config_path
}

resource "kubernetes_secret" "datadog_credentials" {
  metadata {
    name      = "datadog-agent"
    namespace = kubernetes_namespace.sre_stack_monitoring.id
  }
  data = {
    api-key = var.datadog_api_key
    app-key = var.datadog_app_key
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent-${var.env}"
  chart      = "datadog"
  repository = "https://helm.datadoghq.com"
  version    = "3.10.9"
  namespace  = kubernetes_namespace.sre_stack_monitoring.id

  depends_on = [kubernetes_secret.datadog_credentials]

  values = [
    <<-EOT
    datadog:
      apiKeyExistingSecret: datadog-agent
      appKeyExistingSecret: datadog-agent
      site: ${var.datadog_site}
      tags:
        - env:${var.env}
      logs:
        enabled: true
        containerCollectAll: true
      leaderElection: true
      collectEvents: true
      hostVolumeMountPropagation: HostToContainer
    clusterAgent:
      enabled: true
      metricsProvider:
        enabled: true
    networkMonitoring:
      enabled: true
    systemProbe:
      enableTCPQueueLength: true
      enableOOMKill: true
    securityAgent:
      runtime:
        enabled: true
    EOT
  ]
}
