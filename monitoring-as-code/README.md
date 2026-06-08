# Monitoring as Code - Kubernetes · Datadog · Terraform

Vollständiger Observability-Stack auf Kubernetes, deployt über Terraform und Helm mit GitLab CI/CD - kein gespeicherter AWS-Credential.

**Problem:** Datadog-Monitoring war manuell konfiguriert - keine Nachvollziehbarkeit von Änderungen, keine Erkennung manueller Alert-Anpassungen außerhalb des Codes, AWS-Credentials lagen unverschlüsselt in CI-Variablen.

- 12 Datadog-Monitore in Terraform codifiziert auf 3 Schichten - Infrastruktur (Nodes), Kubernetes (Pods) und Anwendung (HTTP 5xx, Latenz p95)
- Statische AWS-Credentials durch OIDC ersetzt - GitLab tauscht ein JWT gegen ein 15-minütiges STS-Token
- Tägliche automatische Drift-Erkennung über geplante Pipeline - Alarm bei Monitoren, die außerhalb von Terraform geändert wurden
- Dev und Prod in separaten Terraform-Workspaces - unterschiedliche Schwellenwerte und Replikas je Umgebung

![CI/CD Pipeline](images/cicd.png)