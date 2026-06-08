# Monitoring Stack - Prometheus · Grafana · Alertmanager

Vollständiger containerisierter Monitoring-Stack mit Docker Compose - System- und Container-Metriken sowie Alerting sofort einsatzbereit.

**Problem:** Kein Einblick in den Zustand von Servern und Containern in der Produktion - Vorfälle wurden zu spät erkannt, meist erst durch Nutzerberichte.

- System-Metriken (CPU, RAM, Disk) über Node Exporter und Docker-Metriken über cAdvisor erfasst
- Automatische Alerts bei kritischen Schwellenwerten - CPU > 80 %, RAM < 10 %, Disk > 85 %, Service down
- Grafana-Dashboards beim Start automatisch provisioniert - kein manuelles Setup erforderlich
- Gesamter Stack mit einem Befehl deploybar: `docker-compose up -d`