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
  default     = ""
  description = "number of gke nodes"
}

variable "gke_version" {
  description = "GKE cluster version"
  type        = string
  default     = ""

}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = ""

}

variable "ip_cidr_range" {
  description = "IP CIDR for VPC"
  type        = string
  default     = ""

}

variable "node_disk_size" {
  description = "Node disk size"
  type        = string
  default     = ""

}
variable "node_location" {
  description = "GKE node location"
  type        = list(string)
  default     = [""]

}

variable "min_num_nodes" {
  description = "No of min node in node group"
  type        = number
  default     = "1"

}
variable "max_num_nodes" {
  description = "max node count in node group"
  type        = number
  default     = "1"

}