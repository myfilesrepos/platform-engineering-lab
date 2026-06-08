resource "datadog_monitor" "node_cpu" {
  name               = "[${upper(var.env)}] High Node CPU — sre-stack"
  type               = "metric alert"
  message            = "Node CPU usage is critically high in **${var.env}**. Notify: @operator"
  escalation_message = "Node CPU still high in **${var.env}** — consider scaling. Notify: @operator"

  query = "avg(last_5m):avg:system.cpu.user{kube_cluster_name:sre-stack} by {host} > 85"

  monitor_thresholds {
    warning  = 70
    critical = 85
  }

  notify_no_data    = true
  no_data_timeframe = 10
  tags              = local.tags
}

resource "datadog_monitor" "node_memory" {
  name               = "[${upper(var.env)}] High Node Memory — sre-stack"
  type               = "metric alert"
  message            = "Node memory usage is critically high in **${var.env}**. Notify: @operator"
  escalation_message = "Node memory still high in **${var.env}**. Notify: @operator"

  query = "avg(last_5m):avg:system.mem.pct_usable{kube_cluster_name:sre-stack} by {host} < 15"

  monitor_thresholds {
    warning  = 25
    critical = 15
  }

  notify_no_data    = true
  no_data_timeframe = 10
  tags              = local.tags
}

resource "datadog_monitor" "node_disk" {
  name               = "[${upper(var.env)}] High Node Disk Usage — sre-stack"
  type               = "metric alert"
  message            = "Node disk usage is critically high in **${var.env}**. Notify: @operator"
  escalation_message = "Node disk still high in **${var.env}** — risk of eviction. Notify: @operator"

  query = "avg(last_5m):avg:system.disk.in_use{kube_cluster_name:sre-stack} by {host,device} > 0.85"

  monitor_thresholds {
    warning  = 0.75
    critical = 0.85
  }

  notify_no_data    = true
  no_data_timeframe = 10
  tags              = local.tags
}

resource "datadog_monitor" "node_network_errors" {
  name               = "[${upper(var.env)}] Node Network Errors — sre-stack"
  type               = "metric alert"
  message            = "Network errors detected on a node in **${var.env}**. Notify: @operator"
  escalation_message = "Network errors still occurring in **${var.env}**. Notify: @operator"

  query = "sum(last_5m):sum:system.net.packets_error.in{kube_cluster_name:sre-stack} by {host}.as_rate() > 100"

  monitor_thresholds {
    warning  = 50
    critical = 100
  }

  notify_no_data = false
  tags           = local.tags
}
