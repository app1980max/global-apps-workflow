
variable "kubeconfig_path" {
  type        = string
  description = "Path to kubeconfig for the target cluster"
  default     = "~/.kube/config"
}

variable "charts_path" {
  default     = "./charts"
  description = "The charts full path"
}




