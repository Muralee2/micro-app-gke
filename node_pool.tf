resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1  # <--- Minimum count to reduce cost

  node_config {
    machine_type = "e2-medium"  # smallest supported by GKE
    disk_size_gb = 30           # fits in 30GB HDD free tier
    disk_type    = "pd-standard"  # use HDD to match free quota

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}

