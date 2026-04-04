
resource "helm_release" "chroma" {
  name       = "chroma"
  namespace  = "chroma"

  repository = "https://amikos-tech.github.io/chromadb-chart/"
  chart      = "chromadb"

  create_namespace = true

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
