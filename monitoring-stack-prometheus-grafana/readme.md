# Monitoring Stack — Prometheus & Grafana

## Stack Overview

| Component | Role | Port |
|---|---|---|
| Prometheus | Metrics collection & storage | 9090 |
| Grafana | Visualization & dashboards | 3000 |
| Node Exporter | System metrics (CPU, RAM, disk) | 9110 |
| cAdvisor | Docker container metrics | 8080 |
| Alertmanager | Alert management | 9093 |

---

## Architecture

```
          GRAFANA (port 3000)
               |
          PROMETHEUS (port 9090)
         /         |          \
  Node Exporter  cAdvisor  Alertmanager
   (system)     (docker)    (alerts)
```

---

## Project Structure

```
prometheus-grafana/
├── docker-compose.yml
├── prometheus/
│   ├── prometheus.yml
│   └── alert.rules
├── grafana/
│   ├── config.monitoring
│   └── provisioning/
│       ├── dashboards/
│       └── datasources/
└── alertmanager/
    └── config.yml
```

---

## Quick Start

```bash
# Start all services
docker-compose up -d

# Check status
docker-compose ps

# Stop
docker-compose down
```

---

## Access

| Service | URL | Credentials |
|---|---|---|
| Grafana | http://localhost:3000 | admin / admin |
| Prometheus | http://localhost:9090 | — |
| cAdvisor | http://localhost:8080 | — |
| Alertmanager | http://localhost:9093 | — |

---

## Dashboards

- **System Monitor** — CPU, RAM, swap, disk usage
- **Docker Monitor** — container CPU, memory, network traffic
- **Prometheus System** — internal Prometheus metrics

---

## Alerts Configured

- CPU > 80%
- Available RAM < 10%
- Disk usage > 85%
- Container stopped unexpectedly
- Service down

---

## Maintenance

```bash
# Add new dashboard
cp new_dashboard.json grafana/provisioning/dashboards/
docker-compose restart grafana

# Backup
docker-compose down
tar -czf backup-monitoring.tar.gz prometheus_data/ grafana_data/

# Restore
tar -xzf backup-monitoring.tar.gz
docker-compose up -d
```

---

## Troubleshooting

```bash
# Dashboards not showing
docker-compose logs grafana | grep dashboard
docker-compose restart grafana

# Prometheus not collecting data
docker-compose exec prometheus cat /etc/prometheus/prometheus.yml
# Then check targets: http://localhost:9090/targets
```
