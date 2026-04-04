
resource "null_resource" "weaviate_products_schema" {
  depends_on = [helm_release.weaviate]

  provisioner "local-exec" {
    command = <<EOT
      echo "📄 Creating Products schema and inserting sample data inside Kubernetes..."

      kubectl run schema-products --rm -i --restart=Never \
        --image=yauritux/busybox-curl:latest \
        -- sh -c '
          set -e

          API_KEY="$$WEAVIATE_API_KEY"
          NAMESPACE="$$WEAVIATE_NAMESPACE"
          WEAVIATE_URL="http://weaviate.$$NAMESPACE.svc.cluster.local:8080"

          # 1️⃣ Create Products schema
          curl -s -X POST $$WEAVIATE_URL/v1/schema \
            -H "Content-Type: application/json" \
            -H "X-API-KEY: $$API_KEY" \
            -d '\''{
              "class": "Products",
              "description": "Stores product information",
              "vectorizer": "none",
              "properties": [
                {"name": "name", "description": "Product name", "dataType": ["string"]},
                {"name": "price", "description": "Product price", "dataType": ["number"]}
              ]
            }'\''

          # 2️⃣ Insert sample products
          for product in \
            '\''{"name":"Laptop","price":1200.50}'\'' \
            '\''{"name":"Smartphone","price":799.99}'\'' \
            '\''{"name":"Headphones","price":199.99}'\''; do
              curl -s -X POST $$WEAVIATE_URL/v1/objects \
                   -H "Content-Type: application/json" \
                   -H "X-API-KEY: $$API_KEY" \
                   -d "{\"class\": \"Products\", \"properties\": $$product}"
          done

          echo "✅ Products schema and sample data setup complete!"
        '
    EOT

    environment = {
      WEAVIATE_API_KEY   = var.api_keys[0]
      WEAVIATE_NAMESPACE = var.namespace
    }
  }
}
