locals {
  environment = terraform.workspace
}

# GKE cluster
data "google_container_engine_versions" "gke_version" {
  location       = var.region
  version_prefix = var.gke_version
}

resource "google_service_account" "default" {
  account_id   = "${local.environment}-${var.application}-service-id"
  display_name = "${local.environment}-${var.application}-Service Account"
}

resource "google_container_cluster" "primary" {
  name     = "${local.environment}-${var.application}-cluster"
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc.name
  subnetwork               = google_compute_subnetwork.node_subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${local.environment}-${var.application}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  version    = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = var.machine_type
    tags         = ["gke-node", "${local.environment}-${var.application}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}