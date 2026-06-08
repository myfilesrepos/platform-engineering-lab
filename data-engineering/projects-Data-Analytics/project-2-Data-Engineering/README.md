# Open-Source Platform - Echtzeit-Datenverarbeitung

Modulare Data-Engineering-Plattform für Echtzeit-Ingestion, -Verarbeitung und -Visualisierung - ausschließlich Open-Source-Komponenten, containerisiert mit Docker Compose.

**Problem:** Keine Infrastruktur für die Verarbeitung kontinuierlicher Datenströme - Daten wurden mit erheblicher Verzögerung per Batch verarbeitet, ohne Qualitätsprüfung und ohne Monitoring.

- Kafka → Spark Streaming-Pipeline aufgebaut - Latenz auf Echtzeit reduziert
- Pipelines mit Airflow orchestriert und Datenqualität mit Great Expectations validiert
- Transformierte Daten in PostgreSQL gespeichert und in Echtzeit in Grafana visualisiert
- Vollständig cloud-unabhängige Architektur - mit einem Befehl deploybar

<p align="center">
  <img src="open-source-data-architecture.png" width="700"/>
</p>

<p align="center">
  <img src="Streaming-Ingestion.png" width="700"/>
</p>

<p align="center">
  <img src="kafka-streaming-write.png" width="700"/>
</p>

<p align="center">
  <img src="postgresql-database-schema.png" width="700"/>
</p>

<p align="center">
  <img src="grafana-realtime-dashboard.png" width="700"/>
</p>