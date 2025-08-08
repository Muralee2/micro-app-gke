resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = "us-central1"
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50
    disk_type    = "pd-standard"  # This avoids triggering SSD quota
    ...
  }
}
