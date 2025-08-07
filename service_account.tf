data "google_service_account" "gke_workload_sa" {
  account_id = "gke-workload-sa"
  project    = var.project_id
}
