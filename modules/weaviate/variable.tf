
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

