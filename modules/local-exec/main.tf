
# 2️⃣ Validate with curl using null_resource
resource "null_resource" "weaviate_curl_check" {
  #depends_on = [helm_release.weaviate]

  provisioner "local-exec" {
    command = <<EOT
      echo "Waiting for Weaviate to be ready..."

      for i in $(seq 1 30); do
        # Use the correct in-cluster service DNS
        if kubectl run curl-test --rm -i --restart=Never \
          --image=yauritux/busybox-curl:latest \
          -- sh -c "curl -s http://weaviate.weaviate.svc.cluster.local:80/v1/meta"; then
          echo "✅ Weaviate is ready!"
          exit 0
        fi
        echo "⏳ Still waiting..."
        sleep 5
      done

      echo "❌ Timeout waiting for Weaviate"
      exit 1
    EOT
  }
}

