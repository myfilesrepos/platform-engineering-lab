# MLOps Multi-Cloud - AWS · Azure · GCP · OIDC Keyless Auth

Produktionsreife MLOps-Plattform für das Deployment von ML-Modellen auf AWS, Azure und GCP - aus einem zentralen GitLab-Repository, ohne gespeicherte Credentials.

**Problem:** Jede Cloud erforderte statische Credentials in GitLab - ein erhebliches Sicherheitsrisiko mit manueller Rotation. Kein einheitlicher Pipeline-Standard deckte alle drei Clouds gleichzeitig ab.

- Alle statischen Credentials durch OIDC/JWT ersetzt - GitLab signiert ein Token pro Job, das gegen kurzlebige Cloud-Credentials (~1h) eingetauscht wird
- Orchestrierung in einem Zentral-Repo zentralisiert - 5 Quell-Repos (model-build, deploy, infra, inferenz, registry) durchlaufen 4 Pflichtgates: `check → analyse → apply → deploy`
- EC2-Runner auf 5 unabhängigen Sicherheitsebenen abgesichert: WireGuard · TLS · OIDC · IAM Least-Privilege · Secrets Manager
- Tägliche automatische Drift-Erkennung - Alarm bei manuellen Infrastrukturänderungen außerhalb von Terraform

![Architektur](docs/architecture/diagrams/centralrepos.png)