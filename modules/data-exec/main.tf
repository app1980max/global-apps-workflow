curl -X POST http://weaviate.weaviate.svc.cluster.local:8080/v1/schema \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: dev-key-123" \
  -d '{
    "class": "Products",
    "description": "Stores product information",
    "vectorizer": "none",
    "properties": [
      {
        "name": "name",
        "description": "Product name",
        "dataType": ["string"]
      },
      {
        "name": "price",
        "description": "Product price",
        "dataType": ["number"]
      }
    ]
  }'



curl -X POST http://weaviate.weaviate.svc.cluster.local:8080/v1/schema \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: dev-key-123" \
  -d '{
    "class": "Users",
    "description": "Stores user info",
    "vectorizer": "none",
    "properties": [
      { "name": "username", "dataType": ["string"] },
      { "name": "email", "dataType": ["string"] }
    ]
  }'
