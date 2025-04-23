resource "kubernetes_deployment" "mlflow_deployment" {
  metadata {
    name = "mlflow-server"
    labels = {
      app = "mlflow"
    }
  }
  spec {
    replicas = 1 # Start with one instance, you can scale later
    selector {
      match_labels = {
        app = "mlflow"
      }
    }
    template {
      metadata {
        labels = {
          app = "mlflow"
        }
      }
      spec {
        containers {
          name = "mlflow"
          image = "mlflow/mlflow" # The official MLflow Docker image
          ports {
            container_port = 5000 # MLflow server typically runs on port 5000
          }
          # You might need to configure environment variables here,
          # for example, for backend store and artifact store.
          # env {
          #   name  = "MLFLOW_TRACKING_URI"
          #   value = "..."
          # }
          # env {
          #   name  = "MLFLOW_ARTIFACT_URI"
          #   value = "..."
          # }
        }
      }
    }
  }
}