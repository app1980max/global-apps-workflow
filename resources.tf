
###  ---  Default Application  ---  ###
module "weaviate" {
  source = "./modules/weaviate"
  depends_on = [kubernetes_namespace.n8n]
}

module "local-exec" {
  source = "./modules/local-exec"
  depends_on = [module.weaviate]
}

module "chroma" {
  source = "./modules/chroma"
  depends_on = [module.local-exec]
}
