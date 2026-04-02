
resource "kubernetes_namespace" "n8n" {
  metadata {
    name = "n8n"
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = all
  }
}

