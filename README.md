# Provision a Nomad cluster in the cloud

Use this repo to provision a Nomad sandbox environment on GCP with
[Packer](https://packer.io) and [Terraform](https://terraform.io).
[Consul](https://www.consul.io/intro/index.html) and
[Vault](https://www.vaultproject.io/intro/index.html) are also installed
(colocated for convenience). 

# Google Persistent Disk

This repo is setup to use GCP to test Nomad's CSI features.  This repo provisions the necessary plugins and volume specs to enable the alpine.nomad job to leverage persistent disks as volumes.

## Setup

Clone the repo and optionally use [Vagrant](https://www.vagrantup.com/intro)
to bootstrap a local staging environment:

```bash
$ git clone https://github.com/louievandyke/gcp-csi-nomad.git
$ vagrant up && vagrant ssh
```

The Vagrant staging environment pre-installs Packer, Terraform, and Docker.

## Provision a cluster

- Follow the steps [here](gcp/README.md) to provision a cluster on GCP using Google Persistent disks as CSI volumes.

Continue with the steps below after a cluster has been provisioned.

## Test

Run a few basic status commands to verify that Consul and Nomad are up and running
properly:

```bash
$ consul members
$ nomad server members
$ nomad node status
```

## Unseal the Vault cluster (optional)

To initialize and unseal Vault, run:

```bash
$ vault operator init -key-shares=1 -key-threshold=1
$ vault operator unseal
$ export VAULT_TOKEN=[INITIAL_ROOT_TOKEN]
```

The `vault init` command above creates a single
[Vault unseal key](https://www.vaultproject.io/docs/concepts/seal.html) for
convenience. For a production environment, it is recommended that you create at
least five unseal key shares and securely distribute them to independent
operators. The `vault init` command defaults to five key shares and a key
threshold of three. If you provisioned more than one server, the others will
become standby nodes but should still be unsealed. You can query the active
and standby nodes independently:

```bash
$ dig active.vault.service.consul
$ dig active.vault.service.consul SRV
$ dig standby.vault.service.consul
```

See the [Getting Started guide](https://www.vaultproject.io/intro/getting-started/first-secret.html)
for an introduction to Vault.

