resource "kind_cluster" "default" {
  name       = "k8s-playground"
  node_image = "kindest/node:v1.28.7"
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
  }
}