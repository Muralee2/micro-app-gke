resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.zone        # ✅ change from var.region to var.zone
  initial_node_count       = 1

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.name

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}
