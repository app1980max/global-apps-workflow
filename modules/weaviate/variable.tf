variable "classes" {
  description = "List of Weaviate classes with properties and vectorizer"
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
}
