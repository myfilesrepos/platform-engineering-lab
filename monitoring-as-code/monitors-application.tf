resource "datadog_monitor" "http_5xx" {
  name               = "[${upper(var.env)}] High HTTP 5xx Error Rate — sre-stack"
  type               = "metric alert"
  message            = "HTTP 5xx error rate is too high in **${var.env}**. Notify: @operator"
  escalation_message = "HTTP 5xx errors still elevated in **${var.env}**. Notify: @operator"

  query = "sum(last_5m):sum:nginx.net.request_per_s{kube_namespace:sre-stack,status_code:5xx}.as_rate() / sum:nginx.net.request_per_s{kube_namespace:sre-stack}.as_rate() * 100 > 5"

  monitor_thresholds {
    warning  = 1
    critical = 5
  }

  notify_no_data = false
  tags           = local.tags
}

resource "datadog_monitor" "latency_p95" {
  name               = "[${upper(var.env)}] High Request Latency p95 — sre-stack"
  type               = "metric alert"
  message            = "p95 latency exceeded threshold in **${var.env}**. Notify: @operator"
  escalation_message = "High latency still ongoing in **${var.env}**. Notify: @operator"

  query = "avg(last_5m):p95:trace.nginx.request.duration{kube_namespace:sre-stack} > 1"

  monitor_thresholds {
    warning  = 0.5
    critical = 1
  }

  notify_no_data = false
  tags           = local.tags
}

resource "datadog_monitor" "no_traffic" {
  name               = "[${upper(var.env)}] No Traffic Detected — sre-stack"
  type               = "metric alert"
  message            = "No traffic received in **${var.env}** for 10 minutes — possible outage. Notify: @operator"
  escalation_message = "Still no traffic in **${var.env}**. Notify: @operator"

  query = "sum(last_10m):sum:nginx.net.request_per_s{kube_namespace:sre-stack}.as_count() < 1"

  monitor_thresholds {
    critical = 1
  }

  notify_no_data    = true
  no_data_timeframe = 15
  tags              = local.tags
}
