resource "google_compute_firewall" "gke_firewall" {
  for_each = var.firewall_rules

  name    = each.value.name
  network = google_compute_network.vpc.name

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  source_tags        = each.value.source_tags
  target_tags        = each.value.target_tags
  direction          = each.value.direction
  source_ranges      = each.value.source_ranges
  destination_ranges = each.value.destination_ranges
}
