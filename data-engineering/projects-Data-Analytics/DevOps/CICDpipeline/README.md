# Azure DevOps - IoT & ML Data Platform

CI/CD-Pipeline auf Azure für die IoT-Datenaufnahme und das automatisierte Deployment von ML-Modellen.

**Problem:** ML-Modelle und IoT-Pipelines wurden manuell deployt, ohne Validierung und ohne Staging-Umgebung - Regressionen in der Produktion waren nicht zu verhindern.

- Build- und Release-Pipelines getrennt - Staging wird vor jedem Produktions-Deployment validiert
- Sicherheitsscan und Code-Qualitätsanalyse als blockierende Gates in jeden Build integriert
- Docker-Images automatisch in Azure Container Registry gebaut und in Azure Container Instances deployt
- ML-Modelle vollständig über Azure Machine Learning trainiert und deployt

<p align="center">
  <img src="./azure-devops-cicd-pipeline.png" width="700"/>
</p>