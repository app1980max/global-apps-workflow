
resource "helm_release" "distributed_chroma" {
  name       = "distributed-chroma"
  namespace  = "chroma"
  repository = "https://charts.chroma.com"  # replace with actual Helm repo URL
  chart      = "distributed-chroma"
  version    = "0.1.0"                       # replace with desired chart version
  create_namespace = true

  atomic           = false
  cleanup_on_fail  = true
  timeout          = 600

  set {
    name  = "replicaCount"
    value = 1 #value = 3
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
