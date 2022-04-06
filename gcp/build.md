#build demo

```
➜  us-east git:(tf-gcp-csi) ✗ echo $GOOGLE_PROJECT
lvd-nomad
➜  us-east git:(tf-gcp-csi) ✗ echo $GOOGLE_APPLICATION_CREDENTIALS
/Users/louvandyke/GitHub/nomad/terraform/gcp/env/us-east/account.json
➜  us-east git:(tf-gcp-csi) ✗ terraform plan -var="project=${GOOGLE_PROJECT}" -var="credentials=${GOOGLE_APPLICATION_CREDENTIALS}"
```

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # module.hashistack.google_compute_firewall.allow-all-internal will be created
  + resource "google_compute_firewall" "allow-all-internal" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-all-internal"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "udp"
        }
      + allow {
          + ports    = []
          + protocol = "icmp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-http-external will be created
  + resource "google_compute_firewall" "allow-http-external" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-http-external"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]
      + target_tags        = [
          + "server",
        ]

      + allow {
          + ports    = [
              + "4646",
              + "8200",
              + "8500",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-ssh will be created
  + resource "google_compute_firewall" "allow-ssh" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-ssh"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "22",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_instance.client[0] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[1] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-2"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[2] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-3"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.server[0] will be created
  + resource "google_compute_instance" "server" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/server.sh "gce" "1" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-server-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "server",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_network.hashistack will be created
  + resource "google_compute_network" "hashistack" {
      + auto_create_subnetworks         = false
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + mtu                             = (known after apply)
      + name                            = "hashistack"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

  # module.hashistack.google_compute_router.hashistack will be created
  + resource "google_compute_router" "hashistack" {
      + creation_timestamp = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-router"
      + network            = "hashistack"
      + project            = (known after apply)
      + region             = "us-east1"
      + self_link          = (known after apply)

      + bgp {
          + advertise_mode = "DEFAULT"
          + asn            = 64514
        }
    }

  # module.hashistack.google_compute_router_nat.hashistack will be created
  + resource "google_compute_router_nat" "hashistack" {
      + enable_endpoint_independent_mapping = true
      + icmp_idle_timeout_sec               = 30
      + id                                  = (known after apply)
      + name                                = "hashistack"
      + nat_ip_allocate_option              = "AUTO_ONLY"
      + project                             = (known after apply)
      + region                              = "us-east1"
      + router                              = "hashistack-router"
      + source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
      + tcp_established_idle_timeout_sec    = 1200
      + tcp_transitory_idle_timeout_sec     = 30
      + udp_idle_timeout_sec                = 30

      + log_config {
          + enable = true
          + filter = "ERRORS_ONLY"
        }
    }

  # module.hashistack.google_compute_subnetwork.hashistack will be created
  + resource "google_compute_subnetwork" "hashistack" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + ip_cidr_range              = "192.168.1.0/24"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "hashistack"
      + network                    = "hashistack"
      + private_ipv6_google_access = (known after apply)
      + project                    = (known after apply)
      + purpose                    = (known after apply)
      + region                     = "us-east1"
      + secondary_ip_range         = (known after apply)
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[0] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-1"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[1] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-2"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[2] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-3"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[3] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-4"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[4] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-5"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_project_iam_custom_role.nomad[0] will be created
  + resource "google_project_iam_custom_role" "nomad" {
      + deleted     = (known after apply)
      + description = "A description"
      + id          = (known after apply)
      + name        = (known after apply)
      + permissions = [
          + "compute.disks.get",
          + "compute.disks.use",
          + "compute.instances.attachDisk",
          + "compute.instances.detachDisk",
          + "compute.instances.get",
        ]
      + project     = (known after apply)
      + role_id     = "nomad"
      + stage       = "GA"
      + title       = "Nomad CSI"
    }

  # module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0] will be created
  + resource "google_project_iam_member" "nomad-sa-csi" {
      + etag    = (known after apply)
      + id      = (known after apply)
      + member  = (known after apply)
      + project = "lvd-nomad"
      + role    = (known after apply)
    }

  # module.hashistack-csi.google_service_account.nomad[0] will be created
  + resource "google_service_account" "nomad" {
      + account_id   = "nomad-sa"
      + disabled     = false
      + display_name = "Nomad CSI Account"
      + email        = (known after apply)
      + id           = (known after apply)
      + name         = (known after apply)
      + project      = (known after apply)
      + unique_id    = (known after apply)
    }

  # module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0] will be created
  + resource "google_service_account_iam_member" "gce-default-account-iam" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = "roles/iam.serviceAccountUser"
      + service_account_id = "projects/lvd-nomad/serviceAccounts/898019676754-compute@developer.gserviceaccount.com"
    }

  # module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0] will be created
  + resource "google_service_account_iam_member" "nomad-sa-csi" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = (known after apply)
      + service_account_id = (known after apply)
    }

  # module.hashistack-csi.google_service_account_key.nomad-sa-key[0] will be created
  + resource "google_service_account_key" "nomad-sa-key" {
      + id                 = (known after apply)
      + key_algorithm      = "KEY_ALG_RSA_2048"
      + name               = (known after apply)
      + private_key        = (sensitive value)
      + private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
      + public_key         = (known after apply)
      + public_key_type    = "TYPE_X509_PEM_FILE"
      + service_account_id = (known after apply)
      + valid_after        = (known after apply)
      + valid_before       = (known after apply)
    }

  # module.hashistack-csi.local_file.nomad-sa-key-file[0] will be created
  + resource "local_file" "nomad-sa-key-file" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "nomad-sa-key.json"
      + id                   = (known after apply)
    }

Plan: 23 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + csi-disks = {
      + hashistack-csi-disk-1 = (known after apply)
      + hashistack-csi-disk-2 = (known after apply)
      + hashistack-csi-disk-3 = (known after apply)
      + hashistack-csi-disk-4 = (known after apply)
      + hashistack-csi-disk-5 = (known after apply)
    }

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you
run "terraform apply" now.
➜  us-east git:(tf-gcp-csi) ✗ terraform apply -var="project=${GOOGLE_PROJECT}" -var="credentials=${GOOGLE_APPLICATION_CREDENTIALS}"


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # module.hashistack.google_compute_firewall.allow-all-internal will be created
  + resource "google_compute_firewall" "allow-all-internal" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-all-internal"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "0-65535",
            ]
          + protocol = "udp"
        }
      + allow {
          + ports    = []
          + protocol = "icmp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-http-external will be created
  + resource "google_compute_firewall" "allow-http-external" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-http-external"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]
      + target_tags        = [
          + "server",
        ]

      + allow {
          + ports    = [
              + "4646",
              + "8200",
              + "8500",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_firewall.allow-ssh will be created
  + resource "google_compute_firewall" "allow-ssh" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-allow-ssh"
      + network            = "hashistack"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "22",
            ]
          + protocol = "tcp"
        }
    }

  # module.hashistack.google_compute_instance.client[0] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[1] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-2"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.client[2] will be created
  + resource "google_compute_instance" "client" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/client.sh "gce" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-client-3"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "client",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_instance.server[0] will be created
  + resource "google_compute_instance" "server" {
      + allow_stopping_for_update = true
      + can_ip_forward            = false
      + cpu_platform              = (known after apply)
      + current_status            = (known after apply)
      + deletion_protection       = false
      + guest_accelerator         = (known after apply)
      + id                        = (known after apply)
      + instance_id               = (known after apply)
      + label_fingerprint         = (known after apply)
      + machine_type              = "n1-standard-2"
      + metadata                  = {
          + "enable-oslogin" = "true"
        }
      + metadata_fingerprint      = (known after apply)
      + metadata_startup_script   = <<-EOT
            sudo bash /ops/shared/scripts/server.sh "gce" "1" "provider=gce project_name=lvd-nomad tag_value=auto-join"
        EOT
      + min_cpu_platform          = (known after apply)
      + name                      = "hashistack-server-1"
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + tags                      = [
          + "auto-join",
          + "server",
        ]
      + tags_fingerprint          = (known after apply)
      + zone                      = "us-east1-c"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "hashistack"
              + labels = (known after apply)
              + size   = 50
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = (known after apply)
          + network_ip         = (known after apply)
          + stack_type         = (known after apply)
          + subnetwork         = "hashistack"
          + subnetwork_project = (known after apply)
        }

      + reservation_affinity {
          + type = (known after apply)

          + specific_reservation {
              + key    = (known after apply)
              + values = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = (known after apply)
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
            ]
        }
    }

  # module.hashistack.google_compute_network.hashistack will be created
  + resource "google_compute_network" "hashistack" {
      + auto_create_subnetworks         = false
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + mtu                             = (known after apply)
      + name                            = "hashistack"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

  # module.hashistack.google_compute_router.hashistack will be created
  + resource "google_compute_router" "hashistack" {
      + creation_timestamp = (known after apply)
      + id                 = (known after apply)
      + name               = "hashistack-router"
      + network            = "hashistack"
      + project            = (known after apply)
      + region             = "us-east1"
      + self_link          = (known after apply)

      + bgp {
          + advertise_mode = "DEFAULT"
          + asn            = 64514
        }
    }

  # module.hashistack.google_compute_router_nat.hashistack will be created
  + resource "google_compute_router_nat" "hashistack" {
      + enable_endpoint_independent_mapping = true
      + icmp_idle_timeout_sec               = 30
      + id                                  = (known after apply)
      + name                                = "hashistack"
      + nat_ip_allocate_option              = "AUTO_ONLY"
      + project                             = (known after apply)
      + region                              = "us-east1"
      + router                              = "hashistack-router"
      + source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
      + tcp_established_idle_timeout_sec    = 1200
      + tcp_transitory_idle_timeout_sec     = 30
      + udp_idle_timeout_sec                = 30

      + log_config {
          + enable = true
          + filter = "ERRORS_ONLY"
        }
    }

  # module.hashistack.google_compute_subnetwork.hashistack will be created
  + resource "google_compute_subnetwork" "hashistack" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + ip_cidr_range              = "192.168.1.0/24"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "hashistack"
      + network                    = "hashistack"
      + private_ipv6_google_access = (known after apply)
      + project                    = (known after apply)
      + purpose                    = (known after apply)
      + region                     = "us-east1"
      + secondary_ip_range         = (known after apply)
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[0] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-1"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[1] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-2"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[2] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-3"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[3] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-4"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_compute_disk.csi-disk[4] will be created
  + resource "google_compute_disk" "csi-disk" {
      + creation_timestamp        = (known after apply)
      + id                        = (known after apply)
      + label_fingerprint         = (known after apply)
      + labels                    = {
          + "environment" = "dev"
        }
      + last_attach_timestamp     = (known after apply)
      + last_detach_timestamp     = (known after apply)
      + name                      = "hashistack-csi-disk-5"
      + physical_block_size_bytes = 4096
      + project                   = (known after apply)
      + self_link                 = (known after apply)
      + size                      = 10
      + source_image_id           = (known after apply)
      + source_snapshot_id        = (known after apply)
      + type                      = "pd-ssd"
      + users                     = (known after apply)
      + zone                      = "us-east1-c"
    }

  # module.hashistack-csi.google_project_iam_custom_role.nomad[0] will be created
  + resource "google_project_iam_custom_role" "nomad" {
      + deleted     = (known after apply)
      + description = "A description"
      + id          = (known after apply)
      + name        = (known after apply)
      + permissions = [
          + "compute.disks.get",
          + "compute.disks.use",
          + "compute.instances.attachDisk",
          + "compute.instances.detachDisk",
          + "compute.instances.get",
        ]
      + project     = (known after apply)
      + role_id     = "nomad"
      + stage       = "GA"
      + title       = "Nomad CSI"
    }

  # module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0] will be created
  + resource "google_project_iam_member" "nomad-sa-csi" {
      + etag    = (known after apply)
      + id      = (known after apply)
      + member  = (known after apply)
      + project = "lvd-nomad"
      + role    = (known after apply)
    }

  # module.hashistack-csi.google_service_account.nomad[0] will be created
  + resource "google_service_account" "nomad" {
      + account_id   = "nomad-sa"
      + disabled     = false
      + display_name = "Nomad CSI Account"
      + email        = (known after apply)
      + id           = (known after apply)
      + name         = (known after apply)
      + project      = (known after apply)
      + unique_id    = (known after apply)
    }

  # module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0] will be created
  + resource "google_service_account_iam_member" "gce-default-account-iam" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = "roles/iam.serviceAccountUser"
      + service_account_id = "projects/lvd-nomad/serviceAccounts/898019676754-compute@developer.gserviceaccount.com"
    }

  # module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0] will be created
  + resource "google_service_account_iam_member" "nomad-sa-csi" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = (known after apply)
      + service_account_id = (known after apply)
    }

  # module.hashistack-csi.google_service_account_key.nomad-sa-key[0] will be created
  + resource "google_service_account_key" "nomad-sa-key" {
      + id                 = (known after apply)
      + key_algorithm      = "KEY_ALG_RSA_2048"
      + name               = (known after apply)
      + private_key        = (sensitive value)
      + private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
      + public_key         = (known after apply)
      + public_key_type    = "TYPE_X509_PEM_FILE"
      + service_account_id = (known after apply)
      + valid_after        = (known after apply)
      + valid_before       = (known after apply)
    }

  # module.hashistack-csi.local_file.nomad-sa-key-file[0] will be created
  + resource "local_file" "nomad-sa-key-file" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "nomad-sa-key.json"
      + id                   = (known after apply)
    }

Plan: 23 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + csi-disks = {
      + hashistack-csi-disk-1 = (known after apply)
      + hashistack-csi-disk-2 = (known after apply)
      + hashistack-csi-disk-3 = (known after apply)
      + hashistack-csi-disk-4 = (known after apply)
      + hashistack-csi-disk-5 = (known after apply)
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.hashistack-csi.google_service_account.nomad[0]: Creating...
module.hashistack.google_compute_network.hashistack: Creating...
module.hashistack-csi.google_project_iam_custom_role.nomad[0]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[3]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[4]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[2]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[1]: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[0]: Creating...
module.hashistack-csi.google_service_account.nomad[0]: Creation complete after 1s [id=projects/lvd-nomad/serviceAccounts/nomad-sa@lvd-nomad.iam.gserviceaccount.com]
module.hashistack-csi.google_service_account_key.nomad-sa-key[0]: Creating...
module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0]: Creating...
module.hashistack-csi.google_service_account_key.nomad-sa-key[0]: Creation complete after 1s [id=projects/lvd-nomad/serviceAccounts/nomad-sa@lvd-nomad.iam.gserviceaccount.com/keys/b6864c7797c5d505e1a97be05dceaaf4e3da316d]
module.hashistack-csi.local_file.nomad-sa-key-file[0]: Creating...
module.hashistack-csi.local_file.nomad-sa-key-file[0]: Creation complete after 0s [id=f61dd11bad54b849ceab7074d3493454db28fb53]
module.hashistack-csi.google_project_iam_custom_role.nomad[0]: Creation complete after 2s [id=projects/lvd-nomad/roles/nomad]
module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0]: Creating...
module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0]: Creating...
module.hashistack-csi.google_service_account_iam_member.gce-default-account-iam[0]: Creation complete after 4s [id=projects/lvd-nomad/serviceAccounts/898019676754-compute@developer.gserviceaccount.com/roles/iam.serviceAccountUser/serviceAccount:nomad-sa@lvd-nomad.iam.gserviceaccount.com]
module.hashistack-csi.google_service_account_iam_member.nomad-sa-csi[0]: Creation complete after 4s [id=projects/lvd-nomad/serviceAccounts/nomad-sa@lvd-nomad.iam.gserviceaccount.com/projects/lvd-nomad/roles/nomad/serviceAccount:nomad-sa@lvd-nomad.iam.gserviceaccount.com]
module.hashistack-csi.google_compute_disk.csi-disk[2]: Still creating... [10s elapsed]
module.hashistack-csi.google_compute_disk.csi-disk[4]: Still creating... [10s elapsed]
module.hashistack-csi.google_compute_disk.csi-disk[3]: Still creating... [10s elapsed]
module.hashistack.google_compute_network.hashistack: Still creating... [10s elapsed]
module.hashistack-csi.google_compute_disk.csi-disk[1]: Still creating... [10s elapsed]
module.hashistack-csi.google_compute_disk.csi-disk[0]: Still creating... [10s elapsed]
module.hashistack-csi.google_project_iam_member.nomad-sa-csi[0]: Creation complete after 8s [id=lvd-nomad/projects/lvd-nomad/roles/nomad/serviceAccount:nomad-sa@lvd-nomad.iam.gserviceaccount.com]
module.hashistack.google_compute_network.hashistack: Creation complete after 11s [id=projects/lvd-nomad/global/networks/hashistack]
module.hashistack.google_compute_router.hashistack: Creating...
module.hashistack.google_compute_subnetwork.hashistack: Creating...
module.hashistack.google_compute_firewall.allow-ssh: Creating...
module.hashistack.google_compute_firewall.allow-http-external: Creating...
module.hashistack.google_compute_firewall.allow-all-internal: Creating...
module.hashistack-csi.google_compute_disk.csi-disk[3]: Creation complete after 12s [id=projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-4]
module.hashistack-csi.google_compute_disk.csi-disk[2]: Creation complete after 12s [id=projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-3]
module.hashistack-csi.google_compute_disk.csi-disk[1]: Creation complete after 12s [id=projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-2]
module.hashistack-csi.google_compute_disk.csi-disk[4]: Creation complete after 12s [id=projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-5]
module.hashistack-csi.google_compute_disk.csi-disk[0]: Creation complete after 12s [id=projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-1]
module.hashistack.google_compute_firewall.allow-http-external: Still creating... [10s elapsed]
module.hashistack.google_compute_firewall.allow-all-internal: Still creating... [10s elapsed]
module.hashistack.google_compute_subnetwork.hashistack: Still creating... [10s elapsed]
module.hashistack.google_compute_router.hashistack: Still creating... [10s elapsed]
module.hashistack.google_compute_firewall.allow-ssh: Still creating... [10s elapsed]
module.hashistack.google_compute_router.hashistack: Creation complete after 11s [id=projects/lvd-nomad/regions/us-east1/routers/hashistack-router]
module.hashistack.google_compute_router_nat.hashistack: Creating...
module.hashistack.google_compute_firewall.allow-all-internal: Creation complete after 11s [id=projects/lvd-nomad/global/firewalls/hashistack-allow-all-internal]
module.hashistack.google_compute_firewall.allow-ssh: Creation complete after 11s [id=projects/lvd-nomad/global/firewalls/hashistack-allow-ssh]
module.hashistack.google_compute_firewall.allow-http-external: Creation complete after 11s [id=projects/lvd-nomad/global/firewalls/hashistack-allow-http-external]
module.hashistack.google_compute_subnetwork.hashistack: Still creating... [20s elapsed]
module.hashistack.google_compute_router_nat.hashistack: Still creating... [10s elapsed]
module.hashistack.google_compute_subnetwork.hashistack: Creation complete after 21s [id=projects/lvd-nomad/regions/us-east1/subnetworks/hashistack]
module.hashistack.google_compute_instance.client[0]: Creating...
module.hashistack.google_compute_instance.server[0]: Creating...
module.hashistack.google_compute_instance.client[2]: Creating...
module.hashistack.google_compute_instance.client[1]: Creating...
module.hashistack.google_compute_router_nat.hashistack: Creation complete after 11s [id=lvd-nomad/us-east1/hashistack-router/hashistack]
module.hashistack.google_compute_instance.client[0]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.client[1]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.server[0]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.client[2]: Still creating... [10s elapsed]
module.hashistack.google_compute_instance.client[2]: Creation complete after 14s [id=projects/lvd-nomad/zones/us-east1-c/instances/hashistack-client-3]
module.hashistack.google_compute_instance.client[1]: Creation complete after 14s [id=projects/lvd-nomad/zones/us-east1-c/instances/hashistack-client-2]
module.hashistack.google_compute_instance.server[0]: Creation complete after 14s [id=projects/lvd-nomad/zones/us-east1-c/instances/hashistack-server-1]
module.hashistack.google_compute_instance.client[0]: Creation complete after 15s [id=projects/lvd-nomad/zones/us-east1-c/instances/hashistack-client-1]

Apply complete! Resources: 23 added, 0 changed, 0 destroyed.

Outputs:

csi-disks = {
  "hashistack-csi-disk-1" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-1"
  "hashistack-csi-disk-2" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-2"
  "hashistack-csi-disk-3" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-3"
  "hashistack-csi-disk-4" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-4"
  "hashistack-csi-disk-5" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-5"
}
➜  us-east git:(tf-gcp-csi) ✗
```

```
➜  us-east git:(tf-gcp-csi) ✗ ll ~/csi
total 144
-rw-r--r--  1 louvandyke  staff   775B Dec 29 13:21 controller.nomad
-rw-r--r--  1 louvandyke  staff   676B Jan  3 12:33 disks.out
-rw-r--r--@ 1 louvandyke  staff   823B Dec 29 14:19 job.nomad
-rw-r--r--  1 louvandyke  staff   1.2K Dec 29 14:30 license.hclic
-rw-r--r--  1 louvandyke  staff   805B Nov 29 18:32 nodes.nomad
-rw-r--r--  1 louvandyke  staff   2.2K Jan  3 12:33 nomad-sa-key.json
-rwxr-xr-x  1 louvandyke  staff   635B Dec  6 10:15 project.sh
-rw-r--r--  1 louvandyke  staff   879B Nov 29 18:49 volume-per-alloc.hcl
-rw-r--r--  1 louvandyke  staff   210B Dec 29 14:15 volume.hcl
-rw-r--r--  1 louvandyke  staff   225B Nov 23 16:47 volume2.hcl
-rw-r--r--  1 louvandyke  staff   225B Dec 30 10:59 zk1.hcl
-rw-r--r--  1 louvandyke  staff   225B Dec 30 10:58 zk2.hcl
-rw-r--r--  1 louvandyke  staff   225B Dec 30 10:59 zk3.hcl
drwxr-xr-x  6 louvandyke  staff   192B Dec 29 14:43 zoo
-rw-r--r--  1 louvandyke  staff    17K Dec 30 11:01 zookeeper-csi.nomad
➜  us-east git:(tf-gcp-csi) ✗ cd ~/csi
➜  csi gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:4646:127.0.0.1:4646
Warning: Permanently added 'compute.6274299494355882035' (ECDSA) to the list of known hosts.
➜  csi gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:8500:127.0.0.1:8500
➜  csi gcloud compute ssh hashistack-server-1 --zone=us-east1-c --tunnel-through-iap -- -f -N -L 127.0.0.1:8200:127.0.0.1:8200
➜  csi cd ../workspace/gcp-nomad-test/nomad/terraform/gcp/env/us-east
➜  us-east git:(tf-gcp-csi) ✗ terraform output > disks.out
➜  us-east git:(tf-gcp-csi) ✗ cat disks.out
csi-disks = {
  "hashistack-csi-disk-1" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-1"
  "hashistack-csi-disk-2" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-2"
  "hashistack-csi-disk-3" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-3"
  "hashistack-csi-disk-4" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-4"
  "hashistack-csi-disk-5" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-5"
}
➜  us-east git:(tf-gcp-csi) ✗ cp disks.out ~/csi
➜  us-east git:(tf-gcp-csi) ✗ cd ~
➜  ~ cd csi
➜  csi cat disks.out
csi-disks = {
  "hashistack-csi-disk-1" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-1"
  "hashistack-csi-disk-2" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-2"
  "hashistack-csi-disk-3" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-3"
  "hashistack-csi-disk-4" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-4"
  "hashistack-csi-disk-5" = "https://www.googleapis.com/compute/v1/projects/lvd-nomad/zones/us-east1-c/disks/hashistack-csi-disk-5"
}
➜  csi ll
total 144
-rw-r--r--  1 louvandyke  staff   775B Dec 29 13:21 controller.nomad
-rw-r--r--  1 louvandyke  staff   676B Jan  3 13:52 disks.out
-rw-r--r--@ 1 louvandyke  staff   823B Dec 29 14:19 job.nomad
-rw-r--r--  1 louvandyke  staff   1.2K Dec 29 14:30 license.hclic
-rw-r--r--  1 louvandyke  staff   805B Nov 29 18:32 nodes.nomad
-rw-r--r--  1 louvandyke  staff   2.2K Jan  3 12:33 nomad-sa-key.json
-rwxr-xr-x  1 louvandyke  staff   635B Dec  6 10:15 project.sh
-rw-r--r--  1 louvandyke  staff   879B Nov 29 18:49 volume-per-alloc.hcl
-rw-r--r--  1 louvandyke  staff   210B Dec 29 14:15 volume.hcl
-rw-r--r--  1 louvandyke  staff   225B Nov 23 16:47 volume2.hcl
-rw-r--r--  1 louvandyke  staff   225B Dec 30 10:59 zk1.hcl
-rw-r--r--  1 louvandyke  staff   225B Dec 30 10:58 zk2.hcl
-rw-r--r--  1 louvandyke  staff   225B Dec 30 10:59 zk3.hcl
drwxr-xr-x  6 louvandyke  staff   192B Dec 29 14:43 zoo
-rw-r--r--  1 louvandyke  staff    17K Dec 30 11:01 zookeeper-csi.nomad
```