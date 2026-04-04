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

default = [
  {
    name        = "Products"
    description = "Stores product information"
    vectorizer  = "text2vec-transformers"
    properties  = [
      { name = "name", dataType = ["text"], description = "Product name" },
      { name = "description", dataType = ["text"], description = "Product description" },
      { name = "price", dataType = ["number"], description = "Product price" }
    ]
  },
  {
    name        = "Article"
    description = "Articles with author/content/title"
    vectorizer  = "text2vec-transformers"
    properties  = [
      { name = "title", dataType = ["text"], description = "Article title" },
      { name = "author", dataType = ["text"], description = "Article author" },
      { name = "content", dataType = ["text"], description = "Article content" }
    ]
  }
]
