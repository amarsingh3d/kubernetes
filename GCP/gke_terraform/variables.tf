variable "region" {
  description = "Define region"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "project id"
  type        = string
  default     = ""
}

variable "environment" {
  description = "assign environment values"
  type        = string
  default     = ""

}

variable "application" {
  description = "application or gcp service name"
  type        = string
  default     = "GKE"


}


variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "gke_version" {
  description = "GKE cluster version"
  type        = string
  default     = ""

}

variable "machine_type" {
  type    = string
  default = ""

}

