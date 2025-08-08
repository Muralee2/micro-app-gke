project_id   = "able-armor-468408-v6"
region       = "us-central1"
cluster_name = "gke-cluster-og"

firewall_rules = {
  allow-egress-to-master = {
    name               = "allow-egress-to-master"
    direction          = "EGRESS"
    source_ranges      = ["172.16.0.0/28"]
    target_tags        = ["gke-node"]
    protocol           = "tcp"
    ports              = ["443", "10250"]
    source_tags        = []
    destination_ranges = []
  }

  allow-inter-node = {
    name               = "allow-inter-node"
    direction          = "INGRESS"
    source_ranges      = []
    target_tags        = ["gke-node"]
    protocol           = "tcp"
    ports              = ["0-65535"]
    source_tags        = ["gke-node"]
    destination_ranges = []
  }

  allow-inter-pod = {
    name               = "allow-inter-pod"
    direction          = "INGRESS"
    source_ranges      = ["10.0.0.0/24"]
    target_tags        = ["gke-node"]
    protocol           = "tcp"
    ports              = ["0-65535"]
    source_tags        = []
    destination_ranges = []
  }
}
