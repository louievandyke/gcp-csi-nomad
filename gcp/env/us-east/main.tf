terraform {
  required_version = ">= 0.12.0"
}


variable "name" {
  type        = string
  default     = "hashistack"
  description = "hashistack"
}

variable "project" {
  type        = string
  default     = "nomad"
  description = "The Google Cloud Platform project to deploy the Nomad cluster in."
}

variable "credentials" {
  type        = string
  default     = "/Users/louvandyke/workspace/gcp-nomad-test/nomad/terraform/gcp/env/us-east/account.json"
  description = "The path to the Google Cloud Platform credentials file (in JSON format) to use."
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "The GCP region to deploy resources in."
}

variable "vm_disk_size_gb" {
  description = "The GCP disk size to use both clients and servers."
  default     = "50"
}

variable "server_count" {
  description = "The number of servers to provision."
  default     = "3"
}

variable "client_count" {
  description = "The number of clients to provision."
  default     = "4"
}

provider "google" {
  project     = var.project
  credentials = file(var.credentials)
}

# Configure the Nomad provider
#provider "nomad" {
#  address = "http://$(curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip):4646"
#  region  = "global"
#}

module "hashistack" {
  source              = "../../modules/hashistack"
  project             = var.project
  credentials         = var.credentials
  server_disk_size_gb = var.vm_disk_size_gb
  server_count        = var.server_count
  client_count        = var.client_count
}

variable "csi_disk_count" {
  type        = number
  description = "The number of block devices to configure for CSI use."
  default     = "3"
}

variable "csi_disk_size_gb" {
  type        = number
  description = "The size in GB of the block devices to configure for CSI use."
  default     = "10"
}

variable "csi_disk_type" {
  type        = string
  description = "The size in GB of the block devices to configure for CSI use."
  default     = "pd-ssd"
}

module "hashistack-csi" {
  source             = "../../modules/hashistack-csi"
  project            = var.project
  csi_disk_count     = var.csi_disk_count
  csi_disk_size_gb   = var.csi_disk_size_gb
  csi_disk_type      = var.csi_disk_type
}

output "csi-disks" {
    value = module.hashistack-csi.csi-disks
}
