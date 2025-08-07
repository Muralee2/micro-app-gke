resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region

  node_config {
    machine_type    = "e2-medium"
    service_account = data.google_service_account.gke_workload_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    tags = ["gke-node"]
  }

  initial_node_count = 2
}
