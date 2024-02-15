# VPC
resource "google_compute_network" "vpc" {
  name                    = "${local.environment}-${var.application}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet Node
resource "google_compute_subnetwork" "node_subnet" {
  name          = "${local.environment}-${var.application}-node-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.0.0.0/16"
}

# # Subnet Cluster
# resource "google_compute_subnetwork" "gke_subnet" {
#   name          = "${var.environment}-${var.application}-cluster-subnet"
#   region        = var.region
#   network       = google_compute_network.vpc.name
#   ip_cidr_range = "10.0.16.0/16"

# }

