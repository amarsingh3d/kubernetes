provider "google" {
  project = var.project_id
  region  = var.region
}


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
  }

  required_version = ">= 0.14"
}

terraform {
  backend "gcs" {
    bucket = "tf-storage-011"
    prefix = "workspaces"

  }
}