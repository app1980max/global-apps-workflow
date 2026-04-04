
variable "namespace" {
  type        = string
  default     = "weaviate"
  description = "Kubernetes namespace"
}

variable "release_name" {
  type    = string
  default = "weaviate"
}

variable "chart_version" {
  type    = string
  default = "17.5.1"
}

variable "vectorizer_module" {
  type    = string
  default = "none"
}

variable "storage_size" {
  type    = string
  default = "10Gi"
}

variable "api_keys" {
  type    = list(string)
  default = ["dev-key-123"]
}

variable "api_users" {
  type    = list(string)
  default = ["admin"]
}

variable "classes" {
  type = list(object({
    name        = string
    description = string
    vectorizer  = string
    properties  = list(object({
      name        = string
      dataType    = list(string)
      description = string
    }))
  }))
  default = []
}

variable "initial_data" {
  type = map(list(object({
    properties = map(any)
  })))
  default = {}
}
