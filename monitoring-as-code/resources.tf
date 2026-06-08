resource "kubernetes_namespace" "sre_stack" {
  metadata {
    name = "sre-stack-${var.env}"
    labels = {
      environment = var.env
      managed-by  = "terraform"
    }
  }
}

resource "kubernetes_deployment" "sre_stack_deploy" {
  metadata {
    name      = "${var.application_name}-${var.env}"
    namespace = kubernetes_namespace.sre_stack.id
    labels = {
      app         = var.application_name
      environment = var.env
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app         = var.application_name
        environment = var.env
      }
    }

    template {
      metadata {
        labels = {
          app         = var.application_name
          environment = var.env
        }
      }

      spec {
        container {
          image = "nginx:1.25"
          name  = var.application_name
        }
      }
    }
  }
}

resource "kubernetes_service" "sre_stack_service" {
  metadata {
    name      = "${var.application_name}-${var.env}"
    namespace = kubernetes_namespace.sre_stack.id
  }

  spec {
    selector = {
      app         = var.application_name
      environment = var.env
    }

    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}
