# DevOps Platform — CI/CD to Kubernetes
**Stack:** Jenkins · AWS EC2 · Kubernetes · Ansible · Prometheus · Grafana

---
## Achieved Improvements & Business Value

- Fully automated testing and deployments using Jenkins, triggered by each GitHub push.
- Significant reduction in AWS costs through lightweight EC2 instances, automated provisioning with Ansible, and on-demand shutdowns.
- Replaced Datadog with Prometheus + Grafana — open-source monitoring with no licensing costs.
- Security and quality checks integrated into the CI/CD pipeline using Trivy and SonarQube.
- Standardized development environments with Docker, Kubernetes, and Ansible.
- Faster production releases thanks to optimized pipelines (from 20+ failed builds to 2 successful ones).
- Real-time monitoring and alerting with Prometheus, Node/Blackbox Exporters, and Alertmanager.
- Automated system updates on all EC2 instances via Ansible playbooks.
- Efficient Kubernetes resource management through namespaces, resource limits, and quotas.
- Rapid regression detection through automated testing and quality gates in every build.
- Reduced human error through reproducible infrastructure using IaC.

## CI/CD Pipeline for Boardgame Application — Full DevOps Lifecycle to Kubernetes

### Project Overview

Successfully designed, built, and deployed a complete CI/CD pipeline for a containerized Boardgame application — deploying seamlessly to a production-grade Kubernetes cluster.

## CI/CD Pipeline Stages

1. Declarative Tool Installation
2. Git Checkout
3. Compile
4. Unit & Integration Tests
5. File System Scan
6. SonarQube Analysis
7. Trivy Quality Gate
8. Build
9. Publish to Nexus
10. Docker Image Build & Tag
11. Docker Image Scan with Trivy
12. Push to DockerHub
13. Kubernetes Deployment
14. Verify Deployment
15. Post Actions (Notifications/Cleanup)

## Tools & Technologies

| Category              | Tools/Technologies                         |
|-----------------------|--------------------------------------------|
| CI/CD                 | Jenkins, Maven                             |
| Code Quality          | SonarQube, Trivy                           |
| Containerization      | Docker                                     |
| Artifact Management   | Nexus Repository Manager                   |
| Infrastructure        | Kubernetes, EC2 (7 Instances)              |
| Monitoring & Alerting | Prometheus, Grafana, Node Exporter         |
| Security              | Trivy (FS Scan + Docker Scan)              |

**EC2 Infrastructure Setup:**
- 1 Master Node (Kubernetes)
- 2 Worker Nodes
- Jenkins, SonarQube, Nexus, Monitoring stack on separate instances

## Infrastructure Automation with Ansible

### What Ansible Managed:
- ✅ Update & upgrade all EC2 instances
- ✅ Install Docker and configure users for Docker access
- ✅ Provision Jenkins and install required plugins
- ✅ Deploy Kubernetes (initialize master node, join worker nodes)
- ✅ Install SonarQube & Nexus with required dependencies
- ✅ Set up monitoring stack: Prometheus, Grafana, Node Exporter, Blackbox Exporter
- ✅ Apply Kubernetes RBAC configurations (via `kubectl` module)
- ✅ Restart services, verify health checks, and apply firewall rules

<p align="center">
  <img src="./image-1.png" alt="DevOps Pipeline" width="700"/>
</p>

<p align="center">
  <img src="./image-2.png" alt="DevOps Pipeline" width="700"/>
</p>

<p align="center">
  <img src="./image-3.png" alt="DevOps Pipeline" width="700"/>
</p>

<p align="center">
  <img src="./image-4.png" alt="DevOps Pipeline" width="700"/>
</p>
