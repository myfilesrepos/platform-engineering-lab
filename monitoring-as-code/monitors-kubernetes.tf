locals {
  tags = ["app:sre-stack", "env:${var.env}", "managed-by:terraform"]
}

resource "datadog_monitor" "pod_health" {
  name               = "[${upper(var.env)}] Kubernetes Pod Count — sre-stack"
  type               = "metric alert"
  message            = "Pod count dropped below threshold in **${var.env}**. Notify: @operator"
  escalation_message = "Pods still unhealthy in **${var.env}**. Notify: @operator"

  query = "min(last_5m):sum:kubernetes.containers.running{kube_app_name:sre-stack} < ${var.pod_alert_critical}"

  monitor_thresholds {
    critical = var.pod_alert_critical
    warning  = var.pod_alert_warning
    ok       = var.replicas
  }

  notify_no_data    = true
  no_data_timeframe = 10
  tags              = local.tags
}

resource "datadog_monitor" "crashloopbackoff" {
  name               = "[${upper(var.env)}] CrashLoopBackOff detected — sre-stack"
  type               = "metric alert"
  message            = "A container is in CrashLoopBackOff in **${var.env}**. Notify: @operator"
  escalation_message = "CrashLoopBackOff still ongoing in **${var.env}**. Notify: @operator"

  query = "max(last_5m):sum:kubernetes_state.container.status_report.count.waiting{reason:crashloopbackoff,kube_namespace:sre-stack} > 0"

  monitor_thresholds {
    critical = 1
  }

  notify_no_data = false
  tags           = local.tags
}

resource "datadog_monitor" "pod_restarts" {
  name               = "[${upper(var.env)}] High Pod Restart Rate — sre-stack"
  type               = "metric alert"
  message            = "Pods are restarting too frequently in **${var.env}**. Notify: @operator"
  escalation_message = "Pod restart rate still high in **${var.env}**. Notify: @operator"

  query = "sum(last_15m):sum:kubernetes.containers.restarts{kube_namespace:sre-stack}.as_count() > 5"

  monitor_thresholds {
    warning  = 3
    critical = 5
  }

  notify_no_data = false
  tags           = local.tags
}

resource "datadog_monitor" "pending_pods" {
  name               = "[${upper(var.env)}] Pods stuck in Pending — sre-stack"
  type               = "metric alert"
  message            = "Pods cannot be scheduled in **${var.env}** — possible resource exhaustion. Notify: @operator"
  escalation_message = "Pending pods still unscheduled in **${var.env}**. Notify: @operator"

  query = "max(last_10m):sum:kubernetes_state.pod.status_phase{phase:pending,kube_namespace:sre-stack} > 0"

  monitor_thresholds {
    critical = 1
  }

  notify_no_data = false
  tags           = local.tags
}

resource "datadog_monitor" "oom_killed" {
  name               = "[${upper(var.env)}] OOMKilled container — sre-stack"
  type               = "metric alert"
  message            = "A container was OOMKilled in **${var.env}** — memory limit too low. Notify: @operator"
  escalation_message = "OOMKills still occurring in **${var.env}**. Notify: @operator"

  query = "sum(last_5m):sum:kubernetes_state.container.status_report.count.terminated{reason:oomkilled,kube_namespace:sre-stack}.as_count() > 0"

  monitor_thresholds {
    critical = 1
  }

  notify_no_data = false
  tags           = local.tags
}
